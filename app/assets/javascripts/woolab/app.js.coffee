@WooLab = angular.module('WooLab',[
    'ngAnimate'
    'ui.router'
    'templates'
    'ngMaterial'
    'admins'
    ])
.run(->
    console.log 'WooLab app running'
)