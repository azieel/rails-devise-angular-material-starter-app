
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
            (reponse)->
                $rootScope.$broadcast 'devise:new-password-token', reponse
                reponse
            (error)->
                $rootScope.$broadcast 'devise:failed-password-token', error
                error
        )
    extend.password_change = ()->
        console.log "change password request"
    extend
]