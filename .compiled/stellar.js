// Generated by LiveScript 1.6.0
(function(){
  var ref$, post, get, map, find, sdk, hd, calcFee, noAccount, getKeys, transformTx, getTransactions, createTransaction, pushTx, checkTxStatus, getBalance, out$ = typeof exports != 'undefined' && exports || this;
  ref$ = require('superagent'), post = ref$.post, get = ref$.get;
  ref$ = require('prelude-ls'), map = ref$.map, find = ref$.find;
  sdk = require('stellar-sdk');
  hd = require('stellar-hd-wallet');
  out$.calcFee = calcFee = function(arg$, cb){
    var network, tx;
    network = arg$.network, tx = arg$.tx;
    return cb(null);
  };
  noAccount = null;
  out$.getKeys = getKeys = function(arg$, cb){
    var network, mnemonic, index, wallet, publicKey, privateKey, address, err;
    network = arg$.network, mnemonic = arg$.mnemonic, index = arg$.index;
    try {
      wallet = hd.fromMnemonic(mnemonic);
      publicKey = wallet.getPublicKey(index);
      privateKey = wallet.getSecret(index);
      address = null;
      return cb(null, {
        publicKey: publicKey,
        privateKey: privateKey,
        address: address
      });
    } catch (e$) {
      err = e$;
      return cb(err);
    }
  };
  transformTx = curry$(function(network, t){
    var explorerUrl, dec, tx, amount, time, url, fee, from, to;
    explorerUrl = network.api.explorerUrl;
    dec = getDec(network);
    network = 'xlm';
    tx = t.trx_id;
    amount = div(t.quantity, dec);
    time = t.timestamp;
    url = explorerUrl + "/tx/" + tx;
    fee = div(0, dec);
    from = t.sender;
    to = t.receiver;
    return {
      network: network,
      tx: tx,
      amount: amount,
      fee: fee,
      time: time,
      url: url,
      from: from,
      to: to
    };
  });
  out$.getTransactions = getTransactions = function(arg$, cb){
    var network, address;
    network = arg$.network, address = arg$.address;
    return cb("Not Implemented");
  };
  out$.createTransaction = createTransaction = curry$(function(arg$, cb){
    var network, account, recipient, amount, amountFee, data, feeType, txType;
    network = arg$.network, account = arg$.account, recipient = arg$.recipient, amount = arg$.amount, amountFee = arg$.amountFee, data = arg$.data, feeType = arg$.feeType, txType = arg$.txType;
    return cb("Not Implemented");
  });
  out$.pushTx = pushTx = curry$(function(arg$, cb){
    var network, rawtx;
    network = arg$.network, rawtx = arg$.rawtx;
    return cb("Not Implemented");
  });
  out$.checkTxStatus = checkTxStatus = function(arg$, cb){
    var network, tx;
    network = arg$.network, tx = arg$.tx;
    return cb("Not Implemented");
  };
  out$.getBalance = getBalance = function(arg$, cb){
    var network, address;
    network = arg$.network, address = arg$.address;
    cb("Not Implemented");
    return get(network.api.apiUrl + "/accounts/{address}").end(function(err, data){
      var balance, xlmBalance, ref$;
      if (err != null) {
        return cb(err);
      }
      balance = find(function(it){
        return it.asset_code === 'XLM';
      })(
      data.body.balances);
      xlmBalance = (ref$ = balance != null ? balance.balance : void 8) != null ? ref$ : 0;
      return cb(null, xlmBalance);
    });
  };
  function curry$(f, bound){
    var context,
    _curry = function(args) {
      return f.length > 1 ? function(){
        var params = args ? args.concat() : [];
        context = bound ? context || this : this;
        return params.push.apply(params, arguments) <
            f.length && arguments.length ?
          _curry.call(context, params) : f.apply(context, params);
      } : f;
    };
    return _curry();
  }
}).call(this);
