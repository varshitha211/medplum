import WebSocket from "ws";
import { execSync } from "child_process";

globalThis.WebSocket = WebSocket;

process.env.MEDPLUM_CONFIG = "/app/medplum_config.json";

// Run database migrations
execSync("node packages/server/dist/migrate.js", { stdio: "inherit" });

// Start Medplum server
await import("./packages/server/dist/index.js");