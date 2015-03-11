#Directive enable dropdown button from materialize framework
angular.module('WooLab').directive("dropdownButton", () ->
    link:
        (scope, element, attributes)->
            $(element).dropdown()
)