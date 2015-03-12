angular.module('AuthModule').controller("PasswordChangeCtrl", [
    '$scope', 'Auth', "$state", "customToast", "passwordRecoveryService", "$rootScope", "$stateParams"
    ($scope, Auth, $state, customToast, passwordRecovery, $rootScope, $stateParams)->
        console.log 'PasswordChangeCtrl'

        $scope.user = {}
        $scope.formError = false

        if $stateParams.reset_password_token == ""
            customToast("error", 'auth.toast_messages.no_token_in_url')
            $state.go('base.passwordRecovery')

        $scope.passwordChange = () ->
            if $scope.user.password != undefined and $scope.user.passwordConfirmation != undefined
                data = 
                    reset_password_token: $stateParams.reset_password_token
                    password: $scope.user.password
                    password_confirmation: $scope.user.passwordConfirmation
                $scope.formError = false
                Auth.password_change(data)
            else
                $scope.formError = true

        $rootScope.$on('devise:reset-password-failure', (event, response)->
            customToast("error", 'auth.toast_messages.password_change_error')
            $state.go('base.login')
        )
        $rootScope.$on('devise:reset-password-success', (event, response)->
            customToast("success", 'auth.toast_messages.password_change_success')
            $state.go('base.dashboard')
        )
])