// Generated by LiveScript 1.6.0
(function(){
  module.exports = function(value){
    var ref$, head, dec;
    if (value == null) {
      return '...';
    }
    ref$ = value.toString().split('.'), head = ref$[0], dec = ref$[1];
    if (dec == null) {
      return head;
    }
    return head + "." + dec.substr(0, 8);
  };
}).call(this);
