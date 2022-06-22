import path from 'path';
import express from 'express';
import routes from './routes';
import wireCtrls from './wireCtrls';

export async function withApp(cb: (_: express.Application, __: (server: any) => void) => void) {

  const app = express();

  Promise.resolve().then(() => {

    let ctrls = new wireCtrls();
    let router = routes(ctrls);

    app.use(router);

    cb(app, server => { });

    console.log(`Domain: {config.net.domain}`);
  }).catch(e => {
    console.log(`[Failed boot] `, e);
    process.exit(1);
  });

}
