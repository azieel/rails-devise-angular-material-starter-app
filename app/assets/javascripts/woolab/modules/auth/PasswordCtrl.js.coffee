angular.module('AuthModule').controller("PasswordCtrl", [
    '$scope', 'Auth', "$state", "$http", "$mdToast", "passwordRecoveryService", "$rootScope"
    ($scope, Auth, $state, $http, $mdToast, passwordRecoveryService, $rootScope)->
        console.log 'PasswordCtrl'        

        $scope.sendRecoveryMail = () ->
            email = $scope.user.email
            Auth.password_recover(email)

        $rootScope.$on('devise:failed-password-token', (event, response)->
            errorMessage = "Aucun compte n'est rataché à cette adresse email"
            $mdToast.show($mdToast.simple().position('top right').content(errorMessage))
        )
        $rootScope.$on('devise:new-password-token', (event, response)->
            sucessMessage = "Les instructions de réinitialisation de mot de passe vous ont été envoyé par mail"
            $mdToast.show($mdToast.simple().position('top right').content(sucessMessage))
        )

])