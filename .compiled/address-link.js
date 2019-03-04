// Generated by LiveScript 1.6.0
(function(){
  var getAddressLabel, getAddressLink, getAddressTitle, out$ = typeof exports != 'undefined' && exports || this, toString$ = {}.toString;
  getAddressLabel = function(wallet){
    var ref$;
    switch (false) {
    case (ref$ = wallet.coin.token) !== 'xem' && ref$ !== 'eos':
      return 'account';
    default:
      return 'address';
    }
  };
  out$.getAddressLink = getAddressLink = function(wallet){
    switch (false) {
    case toString$.call(wallet != null ? wallet.address : void 8).slice(8, -1) !== 'String':
      return wallet.network.api.url + "/" + getAddressLabel(wallet) + "/" + wallet.address;
    case toString$.call(wallet != null ? wallet.address : void 8).slice(8, -1) !== 'Null':
      return wallet.network.registerAccountLink.replace(':public-key', wallet.publicKey);
    default:
      return "#";
    }
  };
  out$.getAddressTitle = getAddressTitle = function(wallet){
    switch (false) {
    case toString$.call(wallet != null ? wallet.address : void 8).slice(8, -1) !== 'String':
      return wallet.address;
    case toString$.call(wallet != null ? wallet.address : void 8).slice(8, -1) !== 'Null':
      return "Register Your Account";
    default:
      return "Unknown Address";
    }
  };
}).call(this);
