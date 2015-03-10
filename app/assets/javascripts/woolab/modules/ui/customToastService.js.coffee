#extend $mdToast service for enable custom presets for toasts with translated content
angular.module('UiModule').factory 'customToast', ['$rootScope', '$mdToast', '$translate', ($rootScope, $mdToast, $translate)->
    this.show = (preset, translation_id)->
        $translate(translation_id).then( (translation) ->
            content = translation
            toastTemplate = '<md-toast class="toast_' + preset + '"><span flex>' + content + '</span></md-toast>'
            $mdToast.show
                template: toastTemplate
                hideDelay: 20000
                position: 'right top'
        )
]