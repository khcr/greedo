app.controller('listen#show', ['$scope', 'params', function($scope, params) {

  var message = "Pas de données pour le moment. Tentative de connection en cours...";

  function connectBroadcaster() {
    connection = peer.connect(params.token);

    connection.on('error', function (err) {
      writeMessage($scope, "Une erreur est apparue");
    });

    connection.on('close', function() {
      connectBroadcaster();
      $scope.warning = message;
      $scope.$apply();
    });
  };

  var peer = new Peer({ host: '192.168.178.58', port: '9000', path: 'greedo' });

  peer.on('error', function (err) {

    if(err.type === "browser-incompatible") {
      writeMessage($scope, "Votre navigateur n'est pas compatible");

    } else if(err.type === "peer-unavailable") {
      $scope.warning = message;
      $scope.$apply();
      connectBroadcaster();

    } else {
      writeMessage($scope, "Une erreur est apparue");
    }

  });

  var connection = connectBroadcaster();

  peer.on('call', function (call) {
    $scope.warning = "";
    $scope.$apply();

    call.answer();
    call.on('stream', function (stream) {
      $('audio').prop('src', URL.createObjectURL(stream));
    });
    call.on('error', function(err) {
      writeMessage($scope, "Une erreur est apparue");
    });
  });

}]);
