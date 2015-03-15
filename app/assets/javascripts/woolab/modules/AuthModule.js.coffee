#dependance: devise-angular module
AuthModule = angular.module('AuthModule', [
    'Devise' 
    'TranslateModule'
])
.config ["AuthProvider", "AuthInterceptProvider", "$translateProvider", "$translatePartialLoaderProvider"
    (AuthProvider, AuthInterceptProvider, $translateProvider, $translatePartialLoaderProvider) ->
        #Activate Http 401 Interceptor    
        AuthInterceptProvider.interceptAuth(true)
        #load auth translations
        $translatePartialLoaderProvider.addPart('auth')


]