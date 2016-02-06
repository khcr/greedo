var fs = require('fs');
var PeerServer = require('peer').PeerServer;

var server = PeerServer({
  port: 9000,
  path: 'greedo',
  ssl: {
    key: fs.readFileSync('/etc/nginx/ssl/nginx.key'),
    cert: fs.readFileSync('/etc/nginx/ssl/nginx.crt')
  }
});
