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
  var file     = req.file,
      Q        = require('q'),
      sharp    = require('sharp'),
      path     = require('path'),
      mkdirp   = require('mkdirp'),
      fs       = require('fs'),
      del      = require('del'),
      archiver = require('archiver'),
      archive  = archiver('zip'),
      config   = require('../../config/environment'),
      exec     = require('child_process').exec,
      image    = sharp(file.path),
      dest     = path.join(config.favicon_dest, file.filename),
      storage  = path.join(config.root, 'storage'),
      lisans   = [ 'browserconfig.xml', 'manifest.json' ],
      resizers = [
        {name: 'favicon.ico', width: 16, height: 16},
        {name: 'favicon-16x16.png', width: 16, height: 16},
        {name: 'favicon-32x32.png', width: 32, height: 32},
        {name: 'favicon-96x96.png', width: 96, height: 96},
        {name: 'ms-icon-70x70.png', width: 70, height: 70},
        {name: 'ms-icon-144x144.png', width: 144, height: 144},
        {name: 'ms-icon-150x150.png', width: 150, height: 150},
        {name: 'ms-icon-310x310.png', width: 310, height: 310},
        {name: 'android-icon-36x36.png', width: 36, height: 36},
        {name: 'android-icon-48x48.png', width: 48, height: 48},
        {name: 'android-icon-72x72.png', width: 72, height: 72},
        {name: 'android-icon-96x96.png', width: 96, height: 96},
        {name: 'android-icon-144x144.png', width: 144, height: 144},
        {name: 'android-icon-192x192.png', width: 192, height: 192},
        {name: 'apple-icon-57x57.png', width: 57, height: 57},
        {name: 'apple-icon-60x60.png', width: 60, height: 60},
        {name: 'apple-icon-72x72.png', width: 72, height: 72},
        {name: 'apple-icon-76x76.png', width: 76, height: 76},
        {name: 'apple-icon-114x114.png', width: 114, height: 114},
        {name: 'apple-icon-120x120.png', width: 120, height: 120},
        {name: 'apple-icon-144x144.png', width: 144, height: 144},
        {name: 'apple-icon-152x152.png', width: 152, height: 152},
        {name: 'apple-icon-180x180.png', width: 180, height: 180},
        {name: 'apple-icon-precomposed.png', width: 192, height: 192},
        {name: 'apple-icon.png', width: 192, height: 192},
      ];


  // Archive
  var zip_filename = file.filename + '.zip',
      now          = new Date(),
      year         = now.getFullYear() + '',
      month        = now.getMonth() + 1 + '',
      day          = now.getDate() + '',
      archive_dir  = path.join(config.download_path, year, month, day),
      zip_filepath = path.join(archive_dir, zip_filename);

  function one() {
    var deferred = Q.defer();
    mkdirp(dest);
    deferred.resolve();
    return deferred.promise;
  }

  function two() {
    return resizers.map(function(obj) {
      return function() {
        return image.resize(obj.width, obj.height).toFile(path.join(dest, obj.name));
      };
    }).reduce(Q.when, Q());
  }

  function three() {
    return lisans.map(function(obj) {
      return function() {
        return fs.createReadStream(path.join(storage, obj))
          .pipe(fs.createWriteStream(path.join(dest, obj)));
      };
    }).reduce(Q.when, Q());
  }

  function four() {
    var deferred = Q.defer();
    mkdirp(archive_dir);
    deferred.resolve();
    return deferred.promise;
  }

  function five() {
    var deferred = Q.defer();
    var cmd = 'cd ' + config.favicon_dest + ' && zip -r ' + zip_filepath + ' ' + file.filename;
    exec(cmd);
    deferred.resolve();
    return deferred.promise;
  }

  function six() {
    var deferred = Q.defer();
    del([file.path], {force: true});
    deferred.resolve();
    return deferred.promise;
  }

  one().then(two).then(three).then(four).then(five).done();

  res.status(201).json({
    'file' : zip_filename,
    'path' : path.join('/favicons', year, month, day, zip_filename)
  });
};
