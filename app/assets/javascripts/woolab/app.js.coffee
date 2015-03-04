#App declaration
@WooLab = angular.module('WooLab',[
    'ngAnimate'
    'ui.router'
    'templates'
    'ngMessages'
    'ngMaterial'
    'Devise'
    'DevisePasswordsRecovery'
    ])
.config( (AuthInterceptProvider) ->
    #Activate Http 401 Interceptor    
    AuthInterceptProvider.interceptAuth(true)
)
.run ($rootScope, $state, Auth, $mdToast) ->
    #401 Interceptor
    $rootScope.$on('devise:unauthorized', (event, reponse, deferred)->
        errorMessage = reponse.data.error
        $mdToast.show($mdToast.simple().position('top right').content(errorMessage))
        $state.go('login')
    )
