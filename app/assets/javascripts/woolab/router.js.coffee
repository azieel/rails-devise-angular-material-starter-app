angular.module('WooLab').config([ '$stateProvider', '$urlRouterProvider', '$locationProvider', 'AuthProvider'
    ($stateProvider, $urlRouterProvider, $locationProvider, AuthProvider) ->
        $stateProvider.state('main', {
            url: "/"
            template: ''
        })
        $stateProvider.state('dashboard', {
            url: "/dashboard"
            templateUrl: 'dashboard.html'
            controller: 'DashboardCtrl'
            resolve:
                auth: (Auth)->
                    Auth.currentUser()
        })
        $urlRouterProvider.otherwise('/');
        $locationProvider.html5Mode(true);
])
