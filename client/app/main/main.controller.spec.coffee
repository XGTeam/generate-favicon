'use strict'

describe 'Controller: MainCtrl', ->

  # load the controller's module
  beforeEach module 'generateFaviconApp' 
  beforeEach module 'stateMock' 

  MainCtrl = undefined
  scope = undefined
  state = undefined
  $httpBackend = undefined

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope, $state) ->
    scope = $rootScope.$new()
    state = $state
    MainCtrl = $controller 'MainCtrl',
      $scope: scope

  it 'should attach a variable to display the form to the scope', ->
    expect(scope.uploaded).toBe true
