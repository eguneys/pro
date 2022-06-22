"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
function routes(c) {
    const router = express_1.default.Router();
    router.post('/', c.pro.list);
    //router.post('/opening/addf', upload.none(), c.opening.addf)
    //router.post('/opening/:id/reset', c.opening.reset)
    //router.use(c.site.notFound.bind(c.site));
    router.use((err, req, res, next) => {
        console.warn(err);
        res.status(500).send(err.message);
    });
    return router;
}
exports.default = routes;
//# sourceMappingURL=routes.js.map