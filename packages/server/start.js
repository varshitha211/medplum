import WebSocket from "ws";

globalThis.WebSocket = WebSocket;

// correct path to root config
process.env.MEDPLUM_CONFIG = "../../medplum_config.json";

// start Medplum server
import("./dist/index.js");