@WooLab.config([ '$stateProvider', '$urlRouterProvider', '$locationProvider'
    ($stateProvider, $urlRouterProvider, $locationProvider) ->
        $stateProvider.state('home', {
            url: "/"
            templateUrl: 'home.html'
            controller: 'HomeCtrl'
        })
        $stateProvider.state('login', {
            url: "/login"
            templateUrl: 'login.html'
            controller: 'LoginCtrl'
        })
        $stateProvider.state('dashboard', {
            url: "/dashboard"
            templateUrl: 'dashboard.html'
            controller: 'DashboardCtrl'
        })

        $urlRouterProvider.otherwise('/');
    
        $locationProvider.html5Mode(true);
])