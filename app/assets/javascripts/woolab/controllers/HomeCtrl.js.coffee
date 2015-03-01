@WooLab.controller("HomeCtrl", [
    '$scope', '$timeout', 'Auth'
    ($scope, $timeout, Auth)->
        console.log(Auth.isAuthenticated())
        credentials = {
            email: 'test@mail.com',
            password: '52145214'
        }

        Auth.login(credentials).then(
            (Admin) ->
                console.log(Admin)
                console.log(Auth.isAuthenticated())
            (error) ->
                console.log(error)
        )
        
])