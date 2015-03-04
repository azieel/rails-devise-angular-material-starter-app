#App declaration
@WooLab = angular.module('WooLab',[
    'ngAnimate'
    'ui.router'
    'templates'
    'ngMessages'
    'ngMaterial'
    'Devise'
    ])
.config( (AuthInterceptProvider) ->
    #Activate Http 401 Interceptor    
    AuthInterceptProvider.interceptAuth(true)
)
.run ($rootScope, $state, Auth, $mdToast) ->
    #401 Interceptor
    $rootScope.$on('devise:unauthorized', (event, reponse, deferred)->
        console.log reponse
        errorMessage = reponse.data.error
        $mdToast.show($mdToast.simple().position('top right').content(errorMessage))
        $state.go('login')
    )
