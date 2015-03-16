angular.module('DashboardModule').controller("DashboardCtrl", [
    '$scope', '$state', 'currentUser', 'Restangular'
    ($scope, $state, currentUser, Restangular)->
        console.log "DashboardCtrl"

        $scope.navTemplate = 'ui/nav/nav-admin.html' if currentUser.role_type == 'Admin'
        $scope.navTemplate = 'ui/nav/nav-admin.html' if currentUser.role_type == 'Customer'
        $scope.currentRole = currentUser.role_type

])