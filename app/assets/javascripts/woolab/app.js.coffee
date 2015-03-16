#App declaration
angular.module('WooLab',[
    'BaseModule'
    'AuthModule'
    'TranslateModule'
    'UiModule'
    'DashboardModule'
    ])
.run ->
    console.log "Application running !"