angular.module('BaseModule').controller("NavCtrl", [
    '$scope', 'Auth', "$state", "customToast", "$translate", "$translatePartialLoader"
    ($scope, Auth, $state, customToast, $translate, $translatePartialLoader)->

        $scope.languageKey = $translate.use()
        $scope.logout = -> Auth.logout()
        $scope.changeLanguage = (languageKey)->
            $translate.use(languageKey)
            $scope.languageKey = languageKey
            
        $scope.$on('devise:logout', (event, oldCurrentUser) ->
            customToast("error", "auth.toast_messages.logout_success")
            $state.go('main')
        )
])