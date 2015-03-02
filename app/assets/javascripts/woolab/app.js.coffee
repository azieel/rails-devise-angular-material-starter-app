@WooLab = angular.module('WooLab',[
    'ngAnimate'
    'ui.router'
    'templates'
    'ngMessages'
    'ngMaterial'
    'admins'
    ])
.run(->
    console.log 'WooLab app running'
)