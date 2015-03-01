angular.module('admins', [
    'Devise'
])
.config([ 'AuthProvider',
    (AuthProvider) ->
        AuthProvider.registerPath('/users/sign_up.json')
        AuthProvider.registerMethod('POST')
        AuthProvider.resourceName('user')
        AuthProvider.loginPath('/users/sign_in.json')
        AuthProvider.loginMethod('POST')
])