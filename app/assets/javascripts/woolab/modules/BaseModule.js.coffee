#Require angular modules libs
angular.module('BaseModule', [
    'ngAnimate'
    'ui.router'
    'templates'
    'ngMessages'
    'ngTouch'
    'ngMaterial'
    'restangular'
])
.config ["$mdThemingProvider", "RestangularProvider"
    ($mdThemingProvider, RestangularProvider) ->
        $mdThemingProvider.theme('default')
        .primaryPalette('blue-grey',
            'default': '400'
            'hue-1': '900'
            'hue-2': '700'
            'hue-3': '400'
        )
        .accentPalette('orange');

        RestangularProvider.setBaseUrl('/api/v1')
]