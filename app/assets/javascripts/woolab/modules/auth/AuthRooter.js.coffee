angular.module('AuthModule').config([ '$stateProvider', '$urlRouterProvider', '$locationProvider', 'AuthProvider'
    ($stateProvider, $urlRouterProvider, $locationProvider, AuthProvider) ->
        $stateProvider.state('base.login', 
            url: "login"
            templateUrl: 'auth/login.html'
            controller: 'LoginCtrl'
        )
        .state('base.passwordRecovery', 
            url: "password_recovery"
            templateUrl: 'auth/password_recovery.html'
            controller: 'PasswordCtrl'
        )
        .state('base.passwordChange', 
            url: "password_change/:reset_password_token"
            templateUrl: 'auth/password_change.html'
            controller: 'PasswordChangeCtrl'
        )
])

