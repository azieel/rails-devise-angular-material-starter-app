@WooLab = angular.module('WooLab',[
    'ngAnimate'
    'ui.router'
    'templates'
    ])
.run(->
    console.log 'WooLab app running'
)