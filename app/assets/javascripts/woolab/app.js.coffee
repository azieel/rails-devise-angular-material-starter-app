#App declaration
@WooLab = angular.module('WooLab',[
    'BaseModules'
    'AuthModules'
    'TranslateModules'
    ])
.run ($rootScope, $state, Auth, $mdToast) ->
    #Initialize 401 Interceptor on devise:unauthorized event
    $rootScope.$on('devise:unauthorized', (event, reponse, deferred)->
        errorMessage = reponse.data.error
        $mdToast.show($mdToast.simple().position('top right').content(errorMessage))
        $state.go('login')
    )
