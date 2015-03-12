angular.module('BaseModule').controller("NavCtrl", [
    '$scope', 'Auth', "$state", "customToast", "$translate"
    ($scope, Auth, $state, customToast, $translate)->
        console.log "NavCtrl"   
        
        $scope.$on('devise:logout', (event, oldCurrentUser) ->
            customToast("error", "auth.toast_messages.logout_success")
            $state.go('main')
        )

        $scope.logout = -> Auth.logout()

        $scope.changeLanguage = (languageKey)->
            $translate.use(languageKey)
            $scope.languageKey = languageKey
            
])