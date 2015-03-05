angular.module('TranslateModules', ['pascalprecht.translate'])
#Config translation paths
.config ($translateProvider, $translatePartialLoaderProvider ) ->

    $translateProvider.useLoader '$translatePartialLoader', 
        urlTemplate: '/UI/assets/translation/{lang}/{part}.json'
    
    $translateProvider.preferredLanguage('fr-FR');