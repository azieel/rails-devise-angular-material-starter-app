angular.module('DashboardModule').controller("EditProfileCtrl", [
    '$scope', '$state', '$mdSidenav', 'Auth', 'UserProfileService', "customToast"
    ($scope, $state, $mdSidenav, Auth, UserProfileService, customToast)->
        console.log "EditProfileCtrl"

        $scope.$on 'openProfilePanel', (event, args) ->
            Auth.get_user_profile().then(
                (profile) ->
                    $scope.profile = {}
                    $scope.profile.first_name = profile.first_name
                    $scope.profile.last_name = profile.last_name
                    $scope.profile.address = profile.address
                    $scope.profile.zip_code = profile.zip_code
                    $scope.profile.city = profile.city
                    $scope.profile.tel = profile.tel
                    $scope.profile.user_attributes = {}
                    $scope.profile.user_attributes = profile.user
                    $scope.profile.user_attributes.password = ""
                    $scope.profile.user_attributes.password_confirmation = ""
                    $mdSidenav('editProfilePanel').open()
            )
        
        $scope.edit_profile = () ->
            profile =  $scope.profile
            Auth.update_user_profile(profile)
])