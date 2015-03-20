#extend Devise-angular service to add profile user by role to Auth service
angular.module('AuthModule').factory 'UserProfileService', ['$rootScope', 'Auth', 'Restangular', "customToast", ($rootScope, Auth, Restangular, customToast)->
    extend = angular.extend (Auth)

    extend.get_user_profile = ()->
        currentUser = extend._currentUser
        profileRoute = currentUser.role_type.toLowerCase() + 's'
        query = Restangular.one(profileRoute, currentUser.role_id).get()
        $rootScope.loadingTracker.addPromise(query)
        query

    extend.update_user_profile = (profile) ->
        
        #retrieve user role, and set route for update
        profileRoute = profile.user_attributes.role_type.toLowerCase() + 's'
        password = profile.user_attributes.password
        password_confirmation = profile.user_attributes.password_confirmation
        passwordIsChanged = false

        #If password change, prepare login credentials for reconnect user after update
        if password != "" and password_confirmation != ""
            passwordIsChanged = true
            credentials = 
                email: profile.user_attributes.email,
                password: profile.user_attributes.password
            
        #Restangular query for update profile (return promise)
        query = Restangular.one(profileRoute, profile.user_attributes.role_id)
        .put(profile)
        .then(
            (new_profile) ->
                if passwordIsChanged
                    Auth.login(credentials)
                customToast("success", 'auth.toast_messages.edit_profile_success')
            (response) ->
                if response.status == 422
                    customToast("error", 'auth.toast_messages.update_password_failure')
                else 
                    customToast("error", 'auth.toast_messages.edit_profile_failure')
        )
        $rootScope.loadingTracker.addPromise(query)
        query
    extend
]