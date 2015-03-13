angular.module('WooLab').config([ '$stateProvider', '$urlRouterProvider', '$locationProvider', 'AuthProvider'
    ($stateProvider, $urlRouterProvider, $locationProvider, AuthProvider) ->
        $stateProvider.state('base', 
            url: "/"
            templateUrl: 'base.html'
            controller: 'BaseCtrl' 
        )
        .state('dashboard', 
            url: "/dashboard"
            templateUrl: 'dashboard.html'
            controller: 'DashboardCtrl'
            resolve:
                currentUser: ['Auth'
                    (Auth) ->
                        Auth.currentUser()
                ]
        )
        .state('dashboard.editProfile', 
            url: "/edit_profile"
            templateUrl: 'edit_profile.html'
            controller: 'EditProfileCtrl'
        )
        
        $urlRouterProvider.otherwise('/');
        $locationProvider.html5Mode(true);

])


