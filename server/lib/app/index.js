"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.withApp = void 0;
const express_1 = __importDefault(require("express"));
const routes_1 = __importDefault(require("./routes"));
const wireCtrls_1 = __importDefault(require("./wireCtrls"));
async function withApp(cb) {
    const app = (0, express_1.default)();
    Promise.resolve().then(() => {
        let ctrls = new wireCtrls_1.default();
        let router = (0, routes_1.default)(ctrls);
        app.use(router);
        cb(app, server => { });
        console.log(`Domain: {config.net.domain}`);
    }).catch(e => {
        console.log(`[Failed boot] `, e);
        process.exit(1);
    });
}
exports.withApp = withApp;
//# sourceMappingURL=index.js.map