angular.module('admins', [
    'Devise'
])
.config([ 'AuthProvider',
    (AuthProvider) ->
        AuthProvider.registerPath('/admins/sign_up.json')
        AuthProvider.registerMethod('GET')
        AuthProvider.resourceName('admin')
        AuthProvider.loginPath('/admins/sign_in.json')
        AuthProvider.loginMethod('POST')
        AuthProvider.resourceName('admin')
])