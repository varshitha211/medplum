import WebSocket from "ws";
import { spawn } from "child_process";

globalThis.WebSocket = WebSocket;

process.env.MEDPLUM_CONFIG = "/app/medplum_config.json";

spawn("node", ["packages/server/dist/index.js"], {
  stdio: "inherit"
});