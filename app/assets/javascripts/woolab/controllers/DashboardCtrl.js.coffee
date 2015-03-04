@WooLab.controller("DashboardCtrl", [
    '$scope', '$state', 'Auth'
    ($scope, $state, Auth)->
        console.log 'isAuthenticated: ' + Auth.isAuthenticated()
        console.log "DashboardCtrl"
        
])