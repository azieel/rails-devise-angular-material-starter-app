angular.module('AuthModule').config([ '$stateProvider', '$urlRouterProvider', '$locationProvider', 'AuthProvider'
    ($stateProvider, $urlRouterProvider, $locationProvider, AuthProvider) ->
        $stateProvider.state('login', {
            url: "/login"
            templateUrl: 'auth/login.html'
            controller: 'LoginCtrl'
        })
        $stateProvider.state('passwordRecovery', {
            url: "/password_recovery"
            templateUrl: 'auth/password_recovery.html'
            controller: 'PasswordCtrl'
        })
        $stateProvider.state('passwordChange', {
            url: "/password_change/:reset_password_token"
            templateUrl: 'auth/password_change.html'
            controller: 'PasswordChangeCtrl'
        })
])

