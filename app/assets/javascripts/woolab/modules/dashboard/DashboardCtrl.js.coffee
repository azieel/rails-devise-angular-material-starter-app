angular.module('WooLab').controller("DashboardCtrl", [
    '$scope', '$state', 'currentUser'
    ($scope, $state, currentUser)->
        console.log "DashboardCtrl"

        $scope.todos = [
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
        ]

        currentRole = currentUser.role_type
        $scope.navTemplate = 'ui/nav/nav-admin.html' if currentRole == 'Admin'
        $scope.navTemplate = 'ui/nav/nav-admin.html' if currentRole == 'Customer'
        $scope.currentRole = currentRole
])