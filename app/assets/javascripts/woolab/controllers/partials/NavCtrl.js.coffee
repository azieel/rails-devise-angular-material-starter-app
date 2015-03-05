@WooLab.controller("NavCtrl", [
    '$scope', 'Auth', "$state", "$mdToast"
    ($scope, Auth, $state, $mdToast)->
        $scope.signedIn = -> Auth.isAuthenticated()
        $scope.logout = -> 
            Auth.logout()
            
        $scope.$on('devise:logout', (event, oldCurrentUser) ->
            $mdToast.show($mdToast.simple().position('top right').content("success logout user"))
            $state.go('home')
        )
])