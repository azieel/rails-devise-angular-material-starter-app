@WooLab.controller("LoginCtrl", [
    '$scope', 'Auth', "$location"
    ($scope, Auth, $location)->
        credentials = {
            email: 'test@mail.com',
            password: '52145214'
        }
        Auth.login(credentials).then(
            (user) ->
                console.log(user)
                console.log(Auth.isAuthenticated())
            (error) ->
                console.log(Auth.isAuthenticated())
                console.log(error)
        )
        $scope.$on('devise:login', (event, currentUser)->
            $location.path('/home')
        )

        $scope.$on('devise:new-session', (event, currentUser)->
            $location.path('/home')
        )
])