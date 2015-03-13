angular.module('BaseModule').controller("NavCtrl", [
    'uiDashboardService', '$scope', 'Auth', "$state", "customToast", "$translate"
    (uiDashboardService, $scope, Auth, $state, customToast, $translate)->
        console.log "NavCtrl"   

        $scope.$on('devise:logout', (event, oldCurrentUser) ->
            customToast("notice", "auth.toast_messages.logout_success")
        )

        $scope.logout = -> Auth.logout().then(
            (oldUser) ->
                $state.go('base', reload:true)
        )

        $scope.changeLanguage = (languageKey)->
            $translate.use(languageKey)
            $scope.languageKey = languageKey

        $scope.openProfilePanel = ()->
            uiDashboardService.OpenProfilePanel()
        
])