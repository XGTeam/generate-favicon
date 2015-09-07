'use strict';

var express    = require('express');
var controller = require('./favicon.controller');

// multer
var multer     = require('multer');
var storage    = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, '/tmp/favicon-uploads')
  }
})
var upload = multer({ storage: storage });

var router = express.Router();

router.get('/', controller.index);
router.get('/:year/:month/:day/:filename', controller.download);
router.post('/', upload.single('file'), controller.create);

module.exports = router;
