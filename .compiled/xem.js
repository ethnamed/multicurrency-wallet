// Generated by LiveScript 1.6.0
(function(){
  var nem, get, jsonParse, ref$, filter, map, head, minus, div, plus, deadline, calcFee, getKeys, transformTransfer, getTransactions, createTransaction, pushTx, checkTxStatus, getBalance, out$ = typeof exports != 'undefined' && exports || this;
  nem = require('nem-sdk')['default'];
  get = require('superagent').get;
  jsonParse = require('../json-parse.ls');
  ref$ = require('prelude-ls'), filter = ref$.filter, map = ref$.map, head = ref$.head;
  ref$ = require('../math.ls'), minus = ref$.minus, div = ref$.div, plus = ref$.plus;
  deadline = require('../deadline.ls');
  out$.calcFee = calcFee = function(arg$, cb){
    var network, tx;
    network = arg$.network, tx = arg$.tx;
    return cb(null);
  };
  out$.getKeys = getKeys = function(arg$, cb){
    var network, mnemonic, index, privateKey, kp, address;
    network = arg$.network, mnemonic = arg$.mnemonic, index = arg$.index;
    privateKey = nem.crypto.helpers.derivePassSha(mnemonic, 6000).priv;
    kp = nem.crypto.keyPair.create(nem.utils.helpers.fixPrivateKey(privateKey));
    address = nem.model.address.toAddress(kp.publicKey.toString(), network.id);
    return cb(null, {
      address: address,
      privateKey: privateKey
    });
  };
  transformTransfer = curry$(function(network, tx){
    var amount, fee, time, to, from, url;
    amount = div(tx.amount, Math.pow(network.decimals, 10));
    fee = div(tx.fee, Math.pow(network.decimals, 10));
    time = tx.timestamp_unix;
    to = tx.r_printablekey;
    from = tx.s_printablekey;
    url = network.api.url + "/transfer/" + tx.id;
    return {
      network: network,
      tx: tx.id,
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
    return get(network.api.apiUrl + "/account?address=" + address).timeout({
      deadline: deadline
    }).end(function(err, data){
      if (err != null) {
        return cb(err);
      }
      return jsonParse(data.text, function(err, result){
        if (result.raw == null) {
          return cb(null, []);
        }
        if (err != null) {
          return cb(err);
        }
        return get(network.api.apiUrl + "/account_transactions?id=" + result.raw.id + "&iid=0").timeout({
          deadline: deadline
        }).end(function(err, data){
          if (err != null) {
            return cb(err);
          }
          return jsonParse(data.text, function(err, result){
            var txs;
            if (err != null) {
              return cb(err);
            }
            txs = map(transformTransfer(network))(
            result.transfers);
            return cb(null, txs);
          });
        });
      });
    });
  };
  out$.createTransaction = createTransaction = curry$(function(arg$, cb){
    var network, account, recipient, amount, amountFee, data, messageType, feeType, txType;
    network = arg$.network, account = arg$.account, recipient = arg$.recipient, amount = arg$.amount, amountFee = arg$.amountFee, data = arg$.data, messageType = arg$.messageType, feeType = arg$.feeType, txType = arg$.txType;
    if (network == null || account == null || recipient == null || amountFee == null) {
      return cb("Params are required");
    }
    return getBalance({
      network: network,
      address: account.address
    }, function(err, xemBalance){
      var common, transferTransaction, transactionEntity, kp, serialized, signature, result, rawtx;
      if (err != null) {
        return cb(err);
      }
      if (+xemBalance < +plus(amount, amountFee)) {
        return cb("Balance is not enough to send this amount");
      }
      common = nem.model.objects.create('common')("", account.privateKey);
      transferTransaction = nem.model.objects.get('transferTransaction');
      transferTransaction.amount = amount;
      transferTransaction.message = data != null ? data : "";
      transferTransaction.recipient = recipient;
      transferTransaction.isMultisig = false;
      transferTransaction.multisigAccount = "";
      transferTransaction.messageType = messageType != null ? messageType : 0;
      transactionEntity = nem.model.transactions.prepare('transferTransaction')(common, transferTransaction, network.id);
      kp = nem.crypto.keyPair.create(nem.utils.helpers.fixPrivateKey(account.privateKey));
      serialized = nem.utils.serialization.serializeTransaction(transactionEntity);
      signature = kp.sign(serialized);
      result = {
        data: nem.utils.convert.ua2hex(serialized),
        signature: signature.toString()
      };
      rawtx = JSON.stringify(result);
      return cb(null, {
        rawtx: rawtx
      });
    });
  });
  out$.pushTx = pushTx = curry$(function(arg$, cb){
    var network, rawtx, endpoint, success, failed;
    network = arg$.network, rawtx = arg$.rawtx;
    endpoint = nem.model.objects.create('endpoint')(network.api.nodeAddress, network.api.nodePort);
    success = function(res){
      var ref$;
      if (res.code >= 2) {
        return cb(res.message);
      }
      return cb(null, res != null ? (ref$ = res.transactionHash) != null ? ref$.data : void 8 : void 8);
    };
    failed = function(res){
      return cb(res);
    };
    return nem.com.requests.transaction.announce(endpoint, rawtx).then(success, failed);
  });
  out$.checkTxStatus = checkTxStatus = function(arg$, cb){
    var network, tx;
    network = arg$.network, tx = arg$.tx;
    return cb("Not Implemented");
  };
  out$.getBalance = getBalance = function(arg$, cb){
    var network, address;
    network = arg$.network, address = arg$.address;
    return get(network.api.apiUrl + "/account?address=" + address).timeout({
      deadline: deadline
    }).end(function(err, data){
      if (err != null) {
        return cb(err);
      }
      return jsonParse(data.text, function(err, result){
        var input, output, saldo, print;
        if (err != null) {
          return cb(err);
        }
        if (result.raw == null) {
          return cb(null, "0");
        }
        input = head(
        map(function(it){
          return it.sum;
        })(
        filter(function(it){
          return it.type === 1;
        })(
        result.raw.balance)));
        output = head(
        map(function(it){
          return it.sum;
        })(
        filter(function(it){
          return it.type === 2;
        })(
        result.raw.balance)));
        if (input == null) {
          return cb(null, "0");
        }
        saldo = minus(input, output != null ? output : 0);
        print = div(saldo, Math.pow(10, 6));
        return cb(null, print);
      });
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
