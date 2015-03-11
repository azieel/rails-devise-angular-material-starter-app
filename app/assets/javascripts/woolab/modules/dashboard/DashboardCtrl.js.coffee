angular.module('WooLab').controller("DashboardCtrl", [
    '$scope', '$state', 'Auth'
    ($scope, $state, Auth)->
        console.log "DashboardCtrl"

        $scope.todos = [
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
            {what: 'Brunch this weekend?',who: 'Min Li Chan',when: '3:08PM',notes: " I'll be in your neighborhood doing errands"}
        ]

        console.log CurrentUser = Auth._currentUser
        CurrentRole = CurrentUser.role_type

])