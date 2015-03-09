angular.module('BaseModule').controller("NavCtrl", [
    '$scope', 'Auth', "$state", "$mdToast", "$translate", "$translatePartialLoader"
    ($scope, Auth, $state, $mdToast, $translate, $translatePartialLoader)->

        $scope.signedIn = -> Auth.isAuthenticated()
        $scope.logout = -> Auth.logout()
            
        $scope.$on('devise:logout', (event, oldCurrentUser) ->
            $mdToast.show($mdToast.simple().position('top right').content("success logout user"))
            $state.go('home')
        )
])