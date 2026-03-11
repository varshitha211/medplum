
import WebSocket from "ws";

globalThis.WebSocket = WebSocket;

process.env.MEDPLUM_CONFIG = "/app/medplum_config.json";

import("./dist/index.js");