function writeMessage(scope, message) {
  var $message = $('#message');
  scope.message = message;
  scope.$apply();
  $message.fadeIn();
  setTimeout(function() { $message.fadeOut() }, 5000);
}