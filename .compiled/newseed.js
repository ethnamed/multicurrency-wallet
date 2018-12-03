// Generated by LiveScript 1.6.0
(function(){
  var react, whitebox, navigate, web3, set, getContainer, generateWallet, newseed, focus;
  react = require('react');
  whitebox = require('whitebox');
  navigate = require('./navigate.ls');
  web3 = require('./web3.ls');
  set = require('./seed.ls').set;
  getContainer = whitebox.getContainer, generateWallet = whitebox.generateWallet;
  newseed = function(arg$){
    var store, generateSeed, changeSeed, save, children;
    store = arg$.store;
    generateSeed = function(){
      return store.current.seed = generateWallet().mnemonic;
    };
    changeSeed = function(event){
      return store.current.seed = event.target.value;
    };
    save = function(){
      if (store.current.seed.length === 0) {
        return alert("Secret key cannot be empty");
      }
      if (store.current.seed.length < 20) {
        return alert("Secret key is so weak");
      }
      if (!confirm("Please confirm that you stored this phrase in safe place?")) {
        return;
      }
      store.current.savedSeed = true;
      set(store.current.seed);
      navigate(store, ':init');
      return web3(store).refresh(function(){});
    };
    return react.createElement('div', {
      className: 'newseed newseed2017396391'
    }, children = [
      react.createElement('div', {
        className: 'title'
      }, ' New Seed Phrase'), react.createElement('textarea', {
        value: store.current.seed + "",
        onChange: changeSeed,
        placeholder: "Click Generate or Put Your Seed Phrase here"
      }), react.createElement('div', {}, children = [
        react.createElement('button', {
          onClick: generateSeed,
          className: 'left'
        }, ' Generate'), react.createElement('button', {
          onClick: save,
          className: 'right'
        }, ' Save')
      ]), react.createElement('div', {
        className: 'hint'
      }, ' The phrase is stored securely on your computer. Do not transfer it to a third party and keep the duplicate in a safe place.')
    ]);
  };
  focus = function(store, cb){
    return setTimeout(function(){
      var textarea;
      textarea = store.root.querySelector('.newseed textarea');
      textarea.focus();
      return cb(null);
    }, 1000);
  };
  newseed.focus = focus;
  module.exports = newseed;
}).call(this);
