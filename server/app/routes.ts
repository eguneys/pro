import express from 'express';
import wireCtrls from './wireCtrls';

export default function routes(c: wireCtrls) {
  const router = express.Router();

  router.post('/', c.pro.list)

  //router.post('/opening/addf', upload.none(), c.opening.addf)
  //router.post('/opening/:id/reset', c.opening.reset)
 
  //router.use(c.site.notFound.bind(c.site));

  router.use((err: any, req: any, res: any, next: any) => {
    console.warn(err);
    res.status(500).send(err.message);
  });

  return router;  
}
