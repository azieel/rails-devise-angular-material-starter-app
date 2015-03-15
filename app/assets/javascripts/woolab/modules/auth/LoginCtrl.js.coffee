angular.module('AuthModule').controller("LoginCtrl", [
    '$scope', 'Auth', "$state", "$http", "customToast", "passwordRecoveryService", "$translate", "$translatePartialLoader", "$filter"
    ($scope, Auth, $state, $http, customToast, passwordRecoveryService, $translate, $translatePartialLoader, $filter)->
        console.log 'LoginCtrl'

        console.log Auth

        $scope.user = {}
        if Auth.isAuthenticated()
            customToast("notice", 'auth.toast_messages.already_login')
            $state.go('dashboard')
        else
            $scope.user.email = ""
            $scope.user.password = ""
        
        $scope.$on('devise:login', (event, currentUser)->
            $state.go('dashboard')
        )
        $scope.$on('devise:new-session', (event, currentUser)->
            $state.go('dashboard')
            customToast("success", 'auth.toast_messages.login_success')
        )

        $scope.authenticate_user = ()->
            credentials = {
                email: $scope.user.email,
                password: $scope.user.password
            }
            Auth.login(credentials)
])