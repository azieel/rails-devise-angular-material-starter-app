@WooLab.controller("DashboardCtrl", [
    '$scope', 'Auth', "$location"
    ($scope, Auth, $location)->
        console.log 'in Dashboard Ctrl'
])