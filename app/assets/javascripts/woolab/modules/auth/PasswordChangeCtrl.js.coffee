angular.module('AuthModule').controller("PasswordChangeCtrl", [
    '$scope', 'Auth', "$state", "$http", "$mdToast", "passwordRecoveryService", "$rootScope", "$stateParams"
    ($scope, Auth, $state, $http, $mdToast, passwordRecovery, $rootScope, $stateParams)->
        console.log 'PasswordChangeCtrl'

        $scope.user = {}
        $scope.formError = false

        if $stateParams.reset_password_token == ""
            msg = "Token absent, verifiez que vous avez bien utilisé le lien présent dans le mail de reinitialisation du mot de passe"
            $mdToast.show($mdToast.simple().position('top right').content(msg))
            $state.go('passwordRecovery')

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
            errorMessage = "Token invalide. Echec du changement de mot de passe."
            $mdToast.show($mdToast.simple().position('top right').content(errorMessage))
            $state.go('login')
        )
        $rootScope.$on('devise:reset-password-success', (event, response)->
            sucessMessage = "Le mot de passe de votre compte a bien été changé."
            $mdToast.show($mdToast.simple().position('top right').content(sucessMessage))
            $state.go('dashboard')
        )
])