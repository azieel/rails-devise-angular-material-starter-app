angular.module('AuthModule').controller("PasswordCtrl", [
    '$scope', 'Auth', "$state", "customToast", "passwordRecoveryService", "$rootScope", "$translate"
    ($scope, Auth, $state, customToast, passwordRecoveryService, $rootScope, $translate)->
        console.log 'PasswordCtrl'        

        $scope.sendRecoveryMail = () ->
            email = $scope.user.email
            Auth.password_recover(email)

        $rootScope.$on('devise:failed-password-token', (event, response)->
            $translate('auth.toast_messages.email_not_found').then( (translation) ->
                customToast("error", translation)
            )
        )
        $rootScope.$on('devise:new-password-token', (event, response)->
            $translate('auth.toast_messages.password_instructions_send').then( (translation) ->
                customToast("success", translation)
            )
            $state.go('login')
        )

])