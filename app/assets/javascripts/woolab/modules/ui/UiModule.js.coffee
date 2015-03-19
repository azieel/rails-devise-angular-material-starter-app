#dependance: devise-angular module
angular.module('UiModule', [])
.config ["$translateProvider", "$translatePartialLoaderProvider"
    ($translateProvider, $translatePartialLoaderProvider) ->
        #load ui translations
        $translatePartialLoaderProvider.addPart('ui')
]
.run ["$rootScope", "$state", "promiseTracker"
    ($rootScope, $state, promiseTracker) ->
        $rootScope.loadingTracker = promiseTracker()
]