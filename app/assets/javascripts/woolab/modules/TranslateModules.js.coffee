angular.module('TranslateModules', ['pascalprecht.translate'])
#Config translation paths
.config ($translateProvider, $translatePartialLoaderProvider ) ->

    $translateProvider.useLoader '$translatePartialLoader', 
        urlTemplate: 'translations/{lang}/{part}.json'
    
    $translateProvider.preferredLanguage('fr-FR');