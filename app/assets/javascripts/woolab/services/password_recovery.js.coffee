
angular.module 'DevisePasswordsRecovery', [
    'Devise'
]
.factory 'passwordRecovery', ['$rootScope', 'Auth', '$http', ($rootScope, Auth, $http)->
    extend = angular.extend (Auth)
    extend.password_recover = (email)->
        email = email || {}
        path = "/users/password.json"
        config = {
            method: "post"
            url: path
        }
        config.data = {}
        config.data['user'] = {email: email}
        $http(config).then(
            (response)->
                $rootScope.$broadcast 'devise:new-password-token', response
                response
            (error)->
                $rootScope.$broadcast 'devise:failed-password-token', error
                error
        )
    extend.password_change = (data)->
        path = "/users/password.json"
        config = {
            method: "patch"
            url: path
        }
        config.data = {}
        config.data['user'] = data
        $http(config).then(
            (response)->
                $rootScope.$broadcast 'devise:reset-password-success', response
                response
            (error)->
                $rootScope.$broadcast 'devise:reset-password-failure', error
                error
        )
    extend
]