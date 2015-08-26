'use strict';

var config = browser.params;

describe('Navbar', function() {
  var page;

  function clickNavItem(nav) {
    nav.element(by.css('a')).click();
  };

  function fullUrl(path) {
    return config.baseUrl + path;
  }

  beforeEach(function() {
    browser.get(config.baseUrl + '/');
    page = require('./navbar.po');
  });

  it('navbar should be defined', function() {
    expect(page.navbar).toBeDefined();
  });

  it('items of navbar should be defined', function() {
    expect(page.items).toBeDefined();
  });

  it('should have 2 items', function() {
    expect(page.items.count()).toEqual(2);
  });

  describe('First item', function() {
    it('label should be 首页', function() {
      expect(page.first.getText()).toBe('首页');
    });

    it('should redirect to home page when click', function() {
      clickNavItem(page.first);
      expect(browser.getCurrentUrl()).toBe(fullUrl('/'));
    });
  });

  describe('Second item', function() {
    it('label should be 关于Favicon', function() {
      expect(page.second.getText()).toBe('关于Favicon');
    });

    it('should redirect to about favicon page when click', function() {
      clickNavItem(page.second);
      expect(browser.getCurrentUrl()).toBe(fullUrl('/about'));
    });
  });
});

