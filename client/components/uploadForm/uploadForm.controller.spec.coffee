'use strict'

describe 'Controller: uploadFormCtrl', ->
  beforeEach module 'generateFaviconApp'
  scope      = undefined
  UploadCtrl = undefined

  beforeEach inject ($rootScope, $controller) ->
    scope   = $rootScope.$new()
    UploadCtrl = $controller 'UploadFormCtrl',
      $scope: scope

  it 'should have an object to contains upload file', inject ->
    expect(scope.uploadForm).toEqual {}
