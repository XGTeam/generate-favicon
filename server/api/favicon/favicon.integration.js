'use strict';

var app = require('../../app');
var request = require('supertest');

describe('Favicon API:', function() {

  describe('GET /api/favicons', function() {
    var favicons;

    beforeEach(function(done) {
      request(app)
        .get('/api/favicons')
        .expect(200)
        .expect('Content-Type', /json/)
        .end(function(err, res) {
          if (err) {
            return done(err);
          }
          favicons = res.body;
          done();
        });
    });

    it('should respond with JSON array', function() {
      favicons.should.be.instanceOf(Array);
    });

  });

});
