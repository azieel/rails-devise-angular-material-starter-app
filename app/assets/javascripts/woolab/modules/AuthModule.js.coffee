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
.run ["$rootScope", "$state", "Auth", "customToast"
    ($rootScope, $state, Auth, customToast) ->

        #variables init
        accessGranted = false
        freeUrl = [
            'password_change'
            'password_change/:reset_password_token'
            'password_recovery'
        ]

        #function to check if a value is in array
        in_array = (testedValue, array) ->
            result = false
            for value in array
                result = true if value == testedValue
            result
        
        #Initialize Auth service
        Auth.currentUser()

        #Check if state is free or protected
        $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
            accessGranted = true if in_array(toState.url, freeUrl)

        #Initialize 401 Interceptor on devise:unauthorized event and redirect if url is not free
        $rootScope.$on 'devise:unauthorized', (event, reponse, deferred)->
            if !accessGranted
                customToast("error", 'auth.toast_messages.unauthorized')
                $state.go('base.login') 
]