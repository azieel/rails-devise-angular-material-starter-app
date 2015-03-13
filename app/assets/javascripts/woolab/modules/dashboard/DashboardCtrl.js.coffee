angular.module('WooLab').controller("DashboardCtrl", [
    '$scope', '$state', 'currentUser', 'Restangular'
    ($scope, $state, currentUser, Restangular)->
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

        console.log currentUser.role_id
        currentRole = currentUser.role_type
        $scope.navTemplate = 'ui/nav/nav-admin.html' if currentRole == 'Admin'
        $scope.navTemplate = 'ui/nav/nav-admin.html' if currentRole == 'Customer'
        $scope.currentRole = currentRole

        Restangular.one('admins', currentUser.role_id).get().then(
            (admin) ->
                console.log admin
            (error)->
                console.log error
        )


])