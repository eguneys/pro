import express from 'express';
export declare function withApp(cb: (_: express.Application, __: (server: any) => void) => void): Promise<void>;
