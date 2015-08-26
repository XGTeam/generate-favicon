/**
 * This file uses the Page Object pattern to define the main page for tests
 * https://docs.google.com/presentation/d/1B6manhG0zEXkC-H-tPo2vwU06JhL8w9-XCF9oehXzAQ
 */

'use strict';

var NavbarComponent = function() {
  var repeater= by.repeater('item in menu');
  this.navbar = element(by.css('.navbar'));
  this.items  = element.all(repeater);
  this.first  = element(repeater.row(0));
  this.second = element(repeater.row(1));
};

module.exports = new NavbarComponent();
