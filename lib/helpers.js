var exec = require('child_process').exec;

exports.checkSshPassExists = function(callback) {
  exec('sshpass -V', function(err, stdout, stderr) {
    if(err) {
      callback(false);
    } else {
      callback(true);
    }
  });
};

exports.printHelp = function() {
  console.error('\nValid Actions');
  console.error('-------------');
  console.error('init          - Initialize a Meteor Up project');
  console.error('setup         - Setup the server');
  console.error('');
  console.error('deploy        - Deploy app to server');
  console.error('reconfig      - Reconfigure the server');
  console.error('');
  console.error('logs [-f -n]  - Access logs');
  console.error('');
  console.error('start         - Start an existing deployment');
  console.error('stop          - Stop an existing deployment');
  console.error('restart       - Restart an existing deployment');

};
