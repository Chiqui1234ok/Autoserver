/*  This file is for testing nginx reverse proxy server 😁
    Just start it and go to hostname:port for check if
    your server is available online 👌 */
const http = require('http');

const hostname = '31.170.165.136';
const port = 3001;

const server = http.createServer((req, res) => {
	res.statusCode = 200;
  	res.setHeader('Content-Type', 'text/plain');
  	res.end('Sysmon App is Up and Running!\n');
});

server.listen(port, hostname, () => {
  	console.log(`Server running at http://${hostname}:${port}/`);
});