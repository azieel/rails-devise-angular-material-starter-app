angular.module('DashboardModule').controller("EditProfileCtrl", [
    '$scope', '$state', '$mdSidenav', 'Auth', 'UserProfileService'
    ($scope, $state, $mdSidenav, Auth, UserProfileService)->
        console.log "EditProfileCtrl"

        $scope.edit_profile = () ->
            profile =  $scope.profile
            Auth.update_user_profile(profile)

        $scope.$on('openProfilePanel', (event, args) ->
            $mdSidenav('editProfilePanel').open()
            Auth.get_user_profile().then(
                (profile) ->
                    $scope.profile = {}
                    $scope.profile.first_name = profile.first_name
                    $scope.profile.last_name = profile.last_name
                    $scope.profile.address = profile.address
                    $scope.profile.zip_code = profile.zip_code
                    $scope.profile.city = profile.city
                    $scope.profile.tel = profile.tel
                    $scope.profile.email = profile.user.email
                    $scope.profile.role_type = profile.user.role_type
                    $scope.profile.password = ""
                    $scope.profile.password_confirmation = ""
            )
        )
])