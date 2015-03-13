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
        $mdThemingProvider.theme('default')
        .primaryPalette('blue-grey',
            'default': '400'
            'hue-1': '900'
            'hue-2': '700'
            'hue-3': '400'
        )
        .accentPalette('orange');
]