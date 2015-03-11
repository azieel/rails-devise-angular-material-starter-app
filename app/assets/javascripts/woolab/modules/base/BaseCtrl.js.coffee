angular.module('BaseModule').controller("BaseCtrl", [
    '$scope', '$state', 'Auth'
    ($scope, $state, Auth)->        
        console.log "BaseCtrl"
        is_logged = Auth.isAuthenticated()
        if is_logged
            console.log currentRole = Auth._CurrentUser
            $scope.navTemplate = 'ui/nav/nav-admin.html'
        else
            $scope.navTemplate = 'ui/nav/nav-not-logged.html'
])