'use strict';

var config = browser.params;

describe('Main View', function() {
  var page;

  beforeEach(function() {
    browser.get(config.baseUrl + '/');
    page = require('./main.po');
  });

  it('should have correct title', function() {
    expect(page.title).toBe('Generate Favicon');
  });

  it('should have a upload form', function() {
    expect(page.form).toBeDefined();
  });
});
