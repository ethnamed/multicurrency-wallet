// Generated by LiveScript 1.6.0
(function(){
  var url;
  url = require('./config.json').url;
  module.exports = function(emailkey){
    return url + "/verify-email/" + emailkey;
  };
}).call(this);
