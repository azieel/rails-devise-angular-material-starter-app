#dependance: devise-angular module
AuthModule = angular.module('AuthModule', [
    'Devise' 
    'TranslateModule'
])
.config ["AuthInterceptProvider", "$translateProvider", "$translatePartialLoaderProvider"
    (AuthInterceptProvider, $translateProvider, $translatePartialLoaderProvider) ->
        #Activate Http 401 Interceptor    
        AuthInterceptProvider.interceptAuth(true)
        #load auth translations
        $translatePartialLoaderProvider.addPart('auth')
]