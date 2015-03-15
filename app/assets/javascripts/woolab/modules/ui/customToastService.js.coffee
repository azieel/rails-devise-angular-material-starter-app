#extend $mdToast service for enable custom presets for toasts with translated content
angular.module('UiModule').factory 'customToast', ['$rootScope', '$mdToast', '$translate', ($rootScope, $mdToast, $translate)->
    this.show = (preset, translation_id, to_translate = true, hideDelay = 1500)->
        if to_translate
            $translate(translation_id).then( (translation) ->
                content = translation
                toastTemplate = '<md-toast class="toast_' + preset + '"><span flex>' + content + '</span></md-toast>'
                $mdToast.show
                    template: toastTemplate
                    hideDelay: hideDelay
                    position: 'right top'
            )
        else
            toastTemplate = '<md-toast class="toast_' + preset + '"><span flex>' + translation_id + '</span></md-toast>'
            $mdToast.show
                template: toastTemplate
                hideDelay: hideDelay
                position: 'right top'
]