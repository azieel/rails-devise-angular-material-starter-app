#extend Devise-angular service to add reset password features
angular.module('AuthModule').factory 'passwordRecoveryService', ['$rootScope', 'Auth', '$http', ($rootScope, Auth, $http)->
    extend = angular.extend (Auth)
    extend.password_recover = (email)->
        email = email || {}
        path = "users/password.json"
        config = {
            method: "post"
            url: path
        }
        config.data = {}
        config.data['user'] = {email: email}
        query = $http(config).then(
            (response)->
                $rootScope.$broadcast 'devise:new-password-token', response
                response
            (error)->
                $rootScope.$broadcast 'devise:failed-password-token', error
                error
        )
        $rootScope.loadingTracker.addPromise(query)
        query
    extend.password_change = (data)->
        path = "users/password.json"
        config = {
            method: "patch"
            url: path
        }
        config.data = {}
        config.data['user'] = data
        query = $http(config).then(
            (response)->
                $rootScope.$broadcast 'devise:reset-password-success', response
                response
            (error)->
                $rootScope.$broadcast 'devise:reset-password-failure', error
                error
        )
        $rootScope.loadingTracker.addPromise(query)
        query
    extend
]