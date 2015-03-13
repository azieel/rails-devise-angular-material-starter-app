#ui dashboard service
angular.module('DashboardModule').factory 'uiDashboardService', [
    '$rootScope'
        ($rootScope)->
            service = 
                OpenProfilePanel: () ->
                    $rootScope.$broadcast('openProfilePanel')
]