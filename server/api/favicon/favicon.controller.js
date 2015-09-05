/**
 * Using Rails-like standard naming convention for endpoints.
 * GET     /api/favicons              ->  index
 * POST    /api/favicons              ->  create
 */

'use strict';

// Gets a list of Favicons
exports.index = function(req, res) {
  res.json([]);
};

// Create a favicon
exports.create = function(req, res) {
};
