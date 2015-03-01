@WooLab.controller("HomeCtrl", [
    '$scope', '$location', 'Auth'
    ($scope, $location, Auth)->
        if(Auth.isAuthenticated())
            $location.path('/dashboard')
        else
            $location.path('/login')
])