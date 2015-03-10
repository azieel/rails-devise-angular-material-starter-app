#App declaration
angular.module('WooLab',[
    'BaseModule'
    'AuthModule'
    'TranslateModule'
    'UiModule'
    ])
.run ["$rootScope", "$state", "Auth", "customToast", "$translate"
    ($rootScope, $state, Auth, customToast, $translate) ->
        #Initialize 401 Interceptor on devise:unauthorized event
        $rootScope.$on('devise:unauthorized', (event, reponse, deferred)->
            errorMessage = reponse.data.error
            customToast("error", errorMessage, false)
            $state.go('login')
        )
        #Refresh translate service on structure change
        $rootScope.$on('$translatePartialLoaderStructureChanged', ->
            $translate.refresh()
        )
]