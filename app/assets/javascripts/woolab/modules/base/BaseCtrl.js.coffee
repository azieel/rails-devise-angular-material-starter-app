angular.module('BaseModule').controller("BaseCtrl", [
    '$scope', '$state', 'Auth'
    ($scope, $state, Auth)->        
        console.log "BaseCtrl"
        Auth.currentUser().then(
            (user) ->
                console.log is_logged = Auth.isAuthenticated()
                if is_logged
                    console.log currentRole = user.role_type
                    if currentRole == 'Admin'
                        $scope.navTemplate = 'ui/nav/nav-admin.html'
                        $state.go('dashboard')
                    else
                        $scope.navTemplate = 'ui/nav/nav-customer.html'
                        $state.go('dashboard')
                else
                    $scope.navTemplate = 'ui/nav/nav-not-logged.html'
                    $state.go('login')
        )
])