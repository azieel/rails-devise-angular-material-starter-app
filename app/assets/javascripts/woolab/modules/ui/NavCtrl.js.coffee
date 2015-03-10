angular.module('BaseModule').controller("NavCtrl", [
    '$scope', 'Auth', "$state", "customToast", "$translate", "$translatePartialLoader"
    ($scope, Auth, $state, customToast, $translate, $translatePartialLoader)->

        $scope.signedIn = -> Auth.isAuthenticated()
        $scope.logout = -> Auth.logout()
            
        $scope.$on('devise:logout', (event, oldCurrentUser) ->
            customToast("error", "auth.toast_messages.logout_success")
            $state.go('home')
        )
])