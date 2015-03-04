@WooLab.controller("PasswordChangeCtrl", [
    '$scope', 'Auth', "$state", "$http", "$mdToast", "passwordRecovery", "$rootScope", "$stateParams"
    ($scope, Auth, $state, $http, $mdToast, passwordRecovery, $rootScope, $stateParams)->
        console.log 'PasswordChangeCtrl'        

        console.log $stateParams.reset_password_token

])