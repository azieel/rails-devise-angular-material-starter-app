angular.module('AuthModules', [
    'Devise' 
    'DevisePasswordsRecovery'
])
.config (AuthInterceptProvider) ->
    #Activate Http 401 Interceptor    
    AuthInterceptProvider.interceptAuth(true)
