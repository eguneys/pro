const { spawn } = require('child_process')
const { Engine } = require('node-uci')


const STOCKFISH_PATH = '/usr/games/stockfish'



class Uci {

  log = ''

  async quit() {
    this.write('quit')

    return await this.getBufferUntil(line => line === 'bye')
  }

  async init() {
    this.child = spawn(__dirname + '/uci.pl')
    this.child.stdout.setEncoding('utf8')

    this.child.stdout.on('data', line => this.log += line)

    await this.getBufferUntil(line => line === 'uciok')
    return this
  }

  async getBufferUntil(condition) {

    let lines = ''
    let listener
    let p = new Promise(resolve => {
      listener = data => {
        data.trim().split('\n').map(line => {
          if (condition?.(line)) {
            resolve()
          }
          lines += line

          if (!condition) {
            resolve()
          }
        })
      }

      this.child.stdout.on('data', listener)
    })

    await p

    this.child.stdout.removeListener('data', listener)

    return lines
  }

  async go() {
    this.write('go')

    return await this.getBufferUntil()
  }

  async isready() {
    this.write('isready')
    await this.getBufferUntil(line => line === 'readyok')
    return this
  }

  async position(fen, moves = []) {
    let cmd
    if (fen === 'startpos') {
      cmd = 'startpos'
    } else {
      cmd = `fen ${fen}`
    }

    if (moves.length > 0) {
      cmd += ` moves ${moves.join(' ')}`
    }

    this.write(`position ${cmd}`)
    return this.isready()
  }
  

  write(cmd) {
    this.child.stdin.write(cmd + '\n')
  }
}

async function main() {

  console.log('initing')
  const Engine = require('node-uci').Engine
  const engine = new Engine(STOCKFISH_PATH)
  await engine.init()
  await engine.isready()

  let uci = new Uci()
  await uci.init()

  let engines = [engine, uci]
  let moves = []
  let scores = []
  let i = 0
  while(true) {
    let _engine = engines[moves.length % engines.length]
    await _engine.position('startpos', moves)
    let res = await _engine.go({})
    let value = ''

    if (typeof res === 'object') {
      value = res.info[res.info.length - 1].score.value
      res = res.bestmove
    }
    moves.push(res)
    scores.push(value)

    console.log(moves)
    if (i++ > 10 || Math.abs(value) > 300) {

      break

    }

  }
 
  console.log(moves.join('\t'))
  console.log(scores.join('\t'))
  console.log('quitting')
  await Promise.all([
    engine.quit(),
    uci.quit()])

}


main()
