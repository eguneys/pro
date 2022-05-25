const fs = require('fs')


fs.readFile('chess.jplt', 'utf8', (err, data) => {

  let res = generate(data)

  fs.writeFile('chess.plt', res, err => {
  })
})

function generate(data) {
  let res = `
:- begin_tests(chess).

:- include(chess).

clear_board :- a_clear; a_turn(w).

` 

  let tests

  let board_name
  let board_begin = false
  let board

  data.split('\n').forEach(line => {

    if (line === '/*') {

      tests = ''


      board_begin = true
      board = ''
      return
    }
    
    if (line === '*/') {


      board_name = gen_board_name()
      res += make_board(board_name, board)

      board_begin = false
      return
    }

    if (board_begin) {
      board += line + '\n'
    }

    let _res = line.split(':-')

    if (_res.length === 2) {
      let [name, body] = _res

      res += make_test(board_name, name, body)
    }


  })

  return res
}

let files = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
function make_board(name, board) {
  let _board = board.split('\n').flatMap((line, i) => {

    let rank = 8 - i
    let res = []

    for (let j = 0; j < line.length; j++) {
      let file = files[j]
      let char = line[j]

      if (char === ' ') {
        continue
      }
      
      let color = char.toUpperCase() === char ? 'w' : 'b'
      let role = char.toLowerCase()
      res.push(`a_drop(${color}-${role}-(${file}-${rank}))`)
    }

    if (res.length === 0) { return [] }
    return res.join(',')
  }).join(', ')

  return `${name}_setup :- clear_board, ${_board}.\n`
}


function make_test(board_name, _test_name, body) {

  let [test_name, ..._pre] = _test_name.split(';')

  let pre = _pre.join(',\n')
  let pre_comma = pre === '' ? '' : ','


  return `
test(${test_name}, [
  setup(${board_name}_setup),
  cleanup(clear_board)${pre_comma}
  ${pre}
]) :- ${body}

`
}


const gen_board_name = (() => {
  let id = 1
  return () => {
    return `board_${id++}`
  }
})()
