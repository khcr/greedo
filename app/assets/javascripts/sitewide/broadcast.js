app.controller('broadcast#show', ['$scope', 'params', function($scope, params) {

    navigator.webkitGetUserMedia({audio: true}, function(localMediaStream) {

      var peer = new Peer(params.token, {key: '9a1r2ugcykwewmi'});

      peer.on('error', function(err) { 
        if(err.type === "network") {
          writeMessage($scope, "Cette channel est déjà utilisée");
        } else if(err.type === "browser-incompatible") {
          writeMessage($scope, "Votre navigateur n'est pas compatible");
        } else {
          writeMessage($scope, "Une erreur est apparue");
        }
      });

      peer.on('connection', function (dataCon) {

        writeMessage($scope, "Vous avez un nouvel auditeur");

        var call = peer.call(dataCon.peer, localMediaStream);
        call.on('error', function(err) {
          writeMessage($scope, "Une erreur est apparue");
        });
      });

      
    }, function() {
      writeMessage($scope, "Impossible d'accéder à votre micro. Veuillez donner l'autorisation ou recharger la page.");
    });

    
}]);