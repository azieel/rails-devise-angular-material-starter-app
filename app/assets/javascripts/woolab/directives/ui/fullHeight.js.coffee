#Directive enable dropdown button from materialize framework
angular.module('WooLab').directive("fullHeight", () ->
    link:
        (scope, element, attributes)->
            height = $(window).height() - parseInt(attributes.fullHeight)
            $(element).innerHeight(height)
)