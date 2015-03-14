angular.module('DashboardModule').controller("EditProfileCtrl", [
    '$scope', '$state', '$mdSidenav', 'Auth', 'UserProfileService', "$mdComponentRegistry"
    ($scope, $state, $mdSidenav, Auth, UserProfileService, $mdComponentRegistry)->
        console.log "EditProfileCtrl"
        
        Auth.get_user_profile().then(
            (profile) ->
                $scope.profile = {}
                $scope.profile.first_name = profile.first_name
                $scope.profile.last_name = profile.last_name
                $scope.profile.address = profile.address
                $scope.profile.zip_code = profile.zip_code
                $scope.profile.city = profile.city
                $scope.profile.tel = profile.tel
        )

        $scope.edit_profile = () ->
            profile =  $scope.profile
            Auth.update_user_profile(profile)


        $scope.$on('sidenav:editProfilePanel:closed', (event, args) ->
            console.log 'sidebar fermée'
        )

        $scope.$on('openProfilePanel', (event, args) ->
            $mdSidenav('editProfilePanel').open()
            $scope.panelIsOpen = $mdSidenav('editProfilePanel').isOpen()
        )

])