#dependance: devise-angular module
angular.module('UiModule', [])
.config ["$translateProvider", "$translatePartialLoaderProvider"
    ($translateProvider, $translatePartialLoaderProvider) ->
        #load ui translations
        $translatePartialLoaderProvider.addPart('ui')
]