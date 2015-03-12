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
        
        $urlRouterProvider.otherwise('/');
        $locationProvider.html5Mode(true);

])


