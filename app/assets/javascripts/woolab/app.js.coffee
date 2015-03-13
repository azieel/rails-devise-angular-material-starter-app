#App declaration
angular.module('WooLab',[
    'BaseModule'
    'AuthModule'
    'TranslateModule'
    'UiModule'
    'DashboardModule'
    ])
.run ["$rootScope", "$state", "Auth", "customToast", "$translate"
    ($rootScope, $state, Auth, customToast, $translate) ->
        
        #Initialize Auth service
        Auth.currentUser()

        #Initialize 401 Interceptor on devise:unauthorized event
        $rootScope.$on('devise:unauthorized', (event, reponse, deferred)->
            errorMessage = reponse.data.error
            customToast("error", errorMessage, false)
            $state.go('base.login')
        )
        
        #Refresh translate service on structure change
        $rootScope.$on('$translatePartialLoaderStructureChanged', ->
            $translate.refresh()
        )

]