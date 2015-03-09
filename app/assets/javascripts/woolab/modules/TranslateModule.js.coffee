angular.module('TranslateModule', ['pascalprecht.translate'])
#Config translation paths
.config ["$translateProvider", "$translatePartialLoaderProvider"
    ($translateProvider, $translatePartialLoaderProvider ) ->

        $translateProvider.useLoader '$translatePartialLoader', 
            urlTemplate: '/translations/{lang}/{part}.json'
        
        $translateProvider.preferredLanguage('fr-FR')
        $translatePartialLoaderProvider.addPart('notices')
]
