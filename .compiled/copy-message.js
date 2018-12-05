// Generated by LiveScript 1.6.0
(function(){
  var react;
  react = require('react');
  module.exports = function(store){
    var copied, copiedClass, children;
    copied = store.current.copied;
    if (copied === '') {
      return null;
    }
    copiedClass = copied === '' ? '' : 'opened';
    return react.createElement('div', {
      key: "copy-message",
      className: copiedClass + " copied copied-995214266"
    }, children = [react.createElement('div', {}, ' Copied'), react.createElement('div', {}, ' ' + copied)]);
  };
}).call(this);
