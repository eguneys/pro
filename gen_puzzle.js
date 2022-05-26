const fs = require('fs')

fs.readFile('athousand_sorted.csv', 'utf8', (err, data) => {

  let res = generate(data)

  fs.writeFile('chess.plt', res, err => {})
})

function generate(data) {

  let res = `
:- begin_tests(chess).

:- include(chess).

clear_board :- a_clear.

  `

  let _ps = data.trim()
    .split('\n')
    .slice(0, 3)
    .map(line => {
    let [id, fen, moves, rating, _, __, ___, tags, link] = line.split(',')

    return {
      id,
      fen,
      moves,
      rating,
      tags,
      link
    }
  })
  .filter(_ => _.tags.includes('mateIn1'))


  res += _ps.map(_ => {

    let { moves } = _

    let [m1, m2] = moves.split(' ')

    let board_name = gen_board_name()

    let name = `test_${_.id}`
    let precomma = `setup(play_move_${name}), set(Uci = ['${m2}'])`
    let body = `mate_in_1(X, Y), move_uci(X, Y, Uci).`

    return [
      make_board_fen(board_name, _.fen),
      make_play_move(name, m1),
      make_test(board_name, name, precomma, body)].join('\n')
  }).join('\n')


  return res + `
  :- end_tests(chess).
    `

}


function make_play_move(name, move) {
  let [f1, r1, f2, r2] = move.split('')

  return `play_move_${name} :- drop(C-R-(${f1}-${r1})),
    a_pickup(${f1}-${r1}),
    a_drop(C-R-(${f2}-${r2})),  
    
    turn(X),
    cntr(Y),
    retract(start(X)),
    a_turn(Y).
    `



}


function make_test(board_name, test_name, pre, body) {

  return `
test(${test_name}, [
  setup(${board_name}_setup),
  cleanup(clear_board),
  ${pre}
]) :- ${body}

`
}

let files = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
let roles = ['k', 'q', 'b', 'n', 'p', 'r']
function make_board_fen(name, board) {


  let [_pieces, _side] = board.split(' ')


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



  return `${name}_setup :- clear_board, a_turn(${_side}), ${_board}.\n`
}




const gen_board_name = (() => {
  let id = 1
  return () => {
    return `board_${id++}`
  }
})()
