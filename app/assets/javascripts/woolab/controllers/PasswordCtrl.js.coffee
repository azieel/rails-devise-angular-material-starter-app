@WooLab.controller("PasswordCtrl", [
    '$scope', 'Auth', "$state", "$http", "$mdToast", "passwordRecovery", "$rootScope"
    ($scope, Auth, $state, $http, $mdToast, passwordRecovery, $rootScope)->
        console.log 'PasswordCtrl'        

        $scope.sendRecoveryMail = () ->
            email = $scope.user.email
            console.log "la"
            Auth.password_recover(email).then(
                (success)->
                    console.log success
                (error)->
                    console.log "foireu mail pas envoyé"
            )

        $rootScope.$on('devise:failed-password-token', (event, reponse)->
            errorMessage = "Aucun compte n'est rataché à cette adresse email"
            $mdToast.show($mdToast.simple().position('top right').theme('purple').content(errorMessage))
        )
        $rootScope.$on('devise:new-password-token', (event, reponse)->
            sucessMessage = "Les instructions de réinitialisation de mot de passe vous ont été envoyé par mail"
            $mdToast.show($mdToast.simple().position('top right').theme('purple').content(sucessMessage))
        )

])