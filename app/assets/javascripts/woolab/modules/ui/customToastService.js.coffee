#extend $mdToast service forenable custom presets for toasts
angular.module('UiModule').factory 'customToast', ['$rootScope', '$mdToast', ($rootScope, $mdToast)->
    this.show = (preset, content)->
        toastTemplate = '<md-toast class="toast_' + preset + '"><span flex>' + content + '</span></md-toast>'
        $mdToast.show
            template: toastTemplate
            hideDelay: 20000
            position: 'right top'
]