angular.module('DashboardModule').controller("EditProfileCtrl", [
    '$scope', '$state', '$mdSidenav', 'Auth', 'UserProfileService'
    ($scope, $state, $mdSidenav, Auth, UserProfileService)->
        console.log "EditProfileCtrl"
        Auth.get_user_profile().then(
            (profile) ->
                $scope.profile = profile
        )

        $scope.$on('openProfilePanel', (event, args) ->
            console.log 'event catched:' + event
            $mdSidenav('right').toggle().then( 
                () ->
                    console.log 'open'
            )
        )



])