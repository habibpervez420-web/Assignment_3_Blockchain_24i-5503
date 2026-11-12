module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545, // Updated to match Ganache CLI
      network_id: "*",
    },
  },
  compilers: {
    solc: {
      version: "0.8.20",
    },
  },
};