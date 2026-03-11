import WebSocket from "ws";

globalThis.WebSocket = WebSocket;

// start medplum server
import("./dist/index.js");