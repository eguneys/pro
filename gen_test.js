const fs = require('fs')

let input = process.argv[2] || 'chess.jplt'


fs.readFile(input, 'utf8', (err, data) => {

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

    if (line[0] === '%') {
      return
    }

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


    if (line.slice(0, 2) === '/*') {

      let fen = line.replace('/*', '').replace('*/', '').trim()

      board_name = gen_board_name()
      res += make_board_fen(board_name, fen)
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

  return res + `

  :- end_tests(chess).
  `
}

let roles = ['k', 'q', 'b', 'n', 'p', 'r']
function make_board_fen(name, board) {


  let [_pieces] = board.split(' ')

  let _board = _pieces.split('/').flatMap((line, i) => {

    let rank = 8 - i
    let res = []

    let file = 0
    for (let j = 0; j < line.length; j++) {
      let char = line[j]

      let role = char.toLowerCase()

      if (roles.includes(role)) {
        let color = char.toUpperCase() === char ? 'w' : 'b'

        res.push(`a_drop(${color}-${role}-(${files[file]}-${rank}))`)
        file++
      } else {

        file += parseInt(char)
      }
    }
    return res
  }).join(', ')



  return `${name}_setup :- clear_board, ${_board}.\n`
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
