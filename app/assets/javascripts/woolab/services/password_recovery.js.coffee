
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
        config.data['user'] = {email: "test@mail.com"}
        $http(config).then(
            (reponse)->
                console.log "requete password ok"
            (error)->
                console.log "requete password merdique"
        )
    extend.password_change = ()->
        console.log "change password request"
    extend
]