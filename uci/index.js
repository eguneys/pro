const { spawn } = require('child_process')

class Uci {

  log = ''

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
        let line = data.trim()
        if (condition?.(line)) {
          resolve()
        }
        lines += line

        if (!condition) {
          resolve()
        }
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

  let uci = new Uci()

  await uci.init()
  await uci.position('startpos', ['e2e4'])
  let res = await uci.go()
  console.log(res)
}


main()
