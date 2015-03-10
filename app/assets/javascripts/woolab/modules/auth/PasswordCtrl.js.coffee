angular.module('AuthModule').controller("PasswordCtrl", [
    '$scope', 'Auth', "$state", "customToast", "passwordRecoveryService", "$rootScope", "$translate"
    ($scope, Auth, $state, customToast, passwordRecoveryService, $rootScope, $translate)->
        console.log 'PasswordCtrl'        

        $scope.sendRecoveryMail = () ->
            email = $scope.user.email
            Auth.password_recover(email)

        $rootScope.$on('devise:failed-password-token', (event, response)->
            customToast("error", 'auth.toast_messages.email_not_found')
        )
        $rootScope.$on('devise:new-password-token', (event, response)->
            customToast("success", 'auth.toast_messages.password_instructions_send')
            $state.go('login')
        )

])