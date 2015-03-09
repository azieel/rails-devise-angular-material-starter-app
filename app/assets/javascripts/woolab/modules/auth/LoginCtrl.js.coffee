angular.module('AuthModule').controller("LoginCtrl", [
    '$scope', 'Auth', "$state", "$http", "$mdToast", "passwordRecoveryService", "$translate", "$translatePartialLoader", "$filter"
    ($scope, Auth, $state, $http, $mdToast, passwordRecoveryService, $translate, $translatePartialLoader, $filter)->
        console.log 'LoginCtrl'

        $scope.user = {}
        
        if Auth.isAuthenticated()
            $mdToast.show($mdToast.simple().position('top right').content("Vous êtes déja connecté!"))
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
                    message = $translate.instant('messages.success_authenticate_user')
                    $mdToast.show($mdToast.simple().position('top right').content(message))
            )
            $scope.$on('devise:login', (event, currentUser)->
                $state.go('dashboard')
            )
            $scope.$on('devise:new-session', (event, currentUser)->
                $state.go('dashboard')
            )

])