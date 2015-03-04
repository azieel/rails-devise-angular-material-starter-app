@WooLab.controller("LoginCtrl", [
    '$scope', 'Auth', "$state", "$http", "$mdToast"
    ($scope, Auth, $state, $http, $mdToast)->
        console.log 'LoginCtrl'

        if Auth.isAuthenticated
            $state.go('dashboard')
        else
            $scope.user.email = ""
            $scope.user.password = ""


        $scope.authenticate_user = ()->
            credentials = {
                email: $scope.user.email,
                password: $scope.user.password
            }
            Auth.login(credentials).then(
                (user) ->
                    console.log "success authenticate user"
                    $mdToast.show($mdToast.simple().position('top right').content("success authenticate user"))
            )
            $scope.$on('devise:login', (event, currentUser)->
                $state.go('dashboard')
            )
            $scope.$on('devise:new-session', (event, currentUser)->
                $state.go('dashboard')
            )

])