angular.module('BaseModule').controller("NavCtrl", [
    '$scope', 'Auth', "$state", "customToast", "$translate", "$translatePartialLoader"
    ($scope, Auth, $state, customToast, $translate, $translatePartialLoader)->

        $scope.logout = -> Auth.logout()
        $scope.changeLanguage = (language_key)->
            $translate.use(language_key)
            
        $scope.$on('devise:logout', (event, oldCurrentUser) ->
            customToast("error", "auth.toast_messages.logout_success")
            $state.go('home')
        )
])