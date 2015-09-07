'use strict';

var proxyquire = require('proxyquire').noPreserveCache();

var faviconCtrlStub = {
  index    : 'faviconCtrl.index',
  create   : 'faviconCtrl.create',
  download : 'faviconCtrl.download'
};

var routerStub = {
  get : sinon.spy(),
  post: sinon.spy(),
};

// require the index with our stubbed out modules
var faviconIndex = proxyquire('./index.js', {
  'express': {
    Router: function() {
      return routerStub;
    }
  },
  './favicon.controller': faviconCtrlStub
});

describe('Favicon API Router:', function() {

  it('should return an express router instance', function() {
    faviconIndex.should.equal(routerStub);
  });

  describe('GET /api/favicons', function() {

    it('should route to favicon.controller.index', function() {
      routerStub.get
                .withArgs('/', 'faviconCtrl.index')
                .should.have.been.calledOnce;
    });

  });

  describe('GET /api/favicons/2015/9/6/hello.zip', function() {

    it('should route to favicon.controller.download', function() {
      routerStub.get
                .withArgs('/2015/9/6/hello.zip', 'faviconCtrl.download')
                .should.have.been.calledOnce;
    });

  });
  // describe('POST /api/favicons', function() {
  //   it('should route to favicon.controller.create', function() {
  //     routerStub.post
  //               .withArgs('/', 'faviconCtrl.create')
  //               .should.have.been.calledOnce;
  //   });
  // });

});
