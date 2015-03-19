#dependance: devise-angular module
angular.module('DashboardModule', [])
.config ["$translateProvider", "$translatePartialLoaderProvider"
    ($translateProvider, $translatePartialLoaderProvider) ->
        #load ui translations
        $translatePartialLoaderProvider.addPart('dashboard')
]