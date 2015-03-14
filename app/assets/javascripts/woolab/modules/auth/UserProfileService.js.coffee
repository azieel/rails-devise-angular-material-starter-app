#extend Devise-angular service to add profile user by role to Auth service
angular.module('AuthModule').factory 'UserProfileService', ['$rootScope', 'Auth', 'Restangular', ($rootScope, Auth, Restangular)->
    extend = angular.extend (Auth)
    extend.get_user_profile = ()->
        currentUser = extend._currentUser
        profileRoute = currentUser.role_type.toLowerCase() + 's'
        Restangular.one(profileRoute, currentUser.role_id).get()

    extend.update_user_profile = (profile) ->
        currentUser = extend._currentUser
        profileRoute = currentUser.role_type.toLowerCase() + 's'
        Restangular.one(profileRoute, currentUser.role_id).put(profile)
    extend
]