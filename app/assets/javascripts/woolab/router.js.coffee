@WooLab.config([ '$stateProvider', '$urlRouterProvider', '$locationProvider'
    ($stateProvider, $urlRouterProvider, $locationProvider) ->
        $stateProvider.state('home', {
            url: "/"
            templateUrl: 'home.html'
            controller: 'HomeCtrl'
        })

        $urlRouterProvider.otherwise('/');
    
        $locationProvider.html5Mode(true);
])