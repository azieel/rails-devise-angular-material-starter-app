@WooLab.config([ '$stateProvider', '$urlRouterProvider', '$locationProvider', 'AuthProvider'
    ($stateProvider, $urlRouterProvider, $locationProvider, AuthProvider) ->
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
            resolve:
                auth: (Auth)->
                    Auth.currentUser()
        })
        $urlRouterProvider.otherwise('/');
    
        $locationProvider.html5Mode(true);



])

