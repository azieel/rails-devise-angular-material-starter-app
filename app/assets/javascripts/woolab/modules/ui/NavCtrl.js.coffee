angular.module('BaseModule').controller("NavCtrl", [
    '$scope', 'Auth', "$state", "customToast", "$translate", "$timeout"
    ($scope, Auth, $state, customToast, $translate, $timeout)->
        console.log "NavCtrl"   

        $scope.$on('devise:logout', (event, oldCurrentUser) ->
            customToast("error", "auth.toast_messages.logout_success")
        )

        $scope.logout = -> Auth.logout().then(
            (oldUser) ->
                $state.go('base', reload:true)
        )

        $scope.changeLanguage = (languageKey)->
            $translate.use(languageKey)
            $scope.languageKey = languageKey
        
])