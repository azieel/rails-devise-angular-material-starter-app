#Require angular modules libs
angular.module('BaseModule', [
    'ngAnimate'
    'ui.router'
    'templates'
    'ngMessages'
    'ngMaterial'
])
.config ["$mdThemingProvider"
    ($mdThemingProvider) ->
        $mdThemingProvider.theme('default').primaryPalette('blue-grey').accentPalette('orange');
]