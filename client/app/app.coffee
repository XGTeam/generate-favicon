'use strict'

angular.module 'generateFaviconApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router',
  'ngFileUpload',
  'ngMaterial'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider, $mdThemingProvider, $compileProvider) ->
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|chrome-extension):/)

  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true

  $mdThemingProvider.theme('default')
    .primaryPalette('blue-grey')
    .accentPalette('green', default: '600')
    .warnPalette('red')
    .backgroundPalette('grey')

.controller 'AppCtrl', ($scope, $mdSidenav, $mdBottomSheet, $mdToast) ->
  $scope.menu = [
    title: '首页'
    state: 'main'
  ,
    title: '关于'
    state: 'about'
  ]

  $scope.share_items = [
    name: '微信'
    icon: 'weixin'
    cmd : 'weixin'
  ,
    name: '微博'
    icon: 'weibo'
    cmd : 'tsina'
  ,
    name: 'QQ空间'
    icon: 'qq'
    cmd : 'qzone'
  ,
    name: 'Facebook'
    icon: 'facebook'
    cmd : 'fbook'
  ,
    name: 'Twitter'
    icon: 'twitter'
    cmd : 'twi'
  ,
    name: '复制网址'
    icon: 'copy'
    cmd : 'copy'
  ]

  $scope.$on 'sharing', (evt) ->
    $scope.showGridBottomSheet(evt)

  $scope.toggleMenu = ->
    $mdSidenav('left').toggle()

  $scope.showGridBottomSheet = ($event) ->
    $mdBottomSheet.show
      template: """
                <md-bottom-sheet class="md-grid" layout="row">
                  <md-list flex layout="row," layout-align="center center">
                    <md-list-item ng-repeat="item in share_items">
                      <md-button class="md-grid-item-content" data-cmd="{{item.cmd}}" ng-click="shareTo(item)">
                        <i class="fa fa-{{item.icon}} fa-3x"></i>
                        <div class="md-grid-text">{{item.name}}</div>
                      </md-button>
                    </md-list-item>
                  </md-list>
                </md-bottom-sheet>
                """
      controller : 'GridBottomSheetCtrl'
      targetEvent: $event
      locals     : share_items: $scope.share_items

.controller 'GridBottomSheetCtrl', ($scope, $mdBottomSheet, share_items) ->
  $scope.share_items = share_items

  $scope.shareTo = (item) ->
    $mdBottomSheet.hide()
    cmd     = item.cmd
    wrapper = document.getElementsByClassName('bdsharebuttonbox')[0]
    buttons = wrapper.getElementsByTagName('a')

    for button in buttons
      button.click() if button.dataset.cmd == cmd
