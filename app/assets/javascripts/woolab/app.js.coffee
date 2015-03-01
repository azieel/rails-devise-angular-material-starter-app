@WooLab = angular.module('WooLab',[
    'ngAnimate'
    'ui.router'
    'templates'
    'ngMaterial'
    ])
.run(->
    console.log 'WooLab app running'
)