global.WebSocket = require("ws");

process.env.MEDPLUM_CONFIG = "/app/medplum_config.json";

const { execSync } = require("child_process");

// Run database migrations
execSync("node packages/server/dist/migrate.js", { stdio: "inherit" });

// Start Medplum server
require("./packages/server/dist/index.js");