#App declaration
angular.module('WooLab',[
    'BaseModule'
    'AuthModule'
    'TranslateModule'
    'UiModule'
    ])
.run ["$rootScope", "$state", "Auth", "$mdToast", "$translate"
    ($rootScope, $state, Auth, $mdToast, $translate) ->
        #Initialize 401 Interceptor on devise:unauthorized event
        $rootScope.$on('devise:unauthorized', (event, reponse, deferred)->
            errorMessage = reponse.data.error
            $mdToast.show($mdToast.simple().position('top right').content(errorMessage))
            $state.go('login')
        )
        #Refresh translate service on structure change
        $rootScope.$on('$translatePartialLoaderStructureChanged', ->
            $translate.refresh()
        )
]