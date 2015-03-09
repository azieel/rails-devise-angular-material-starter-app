#Directive to compare two fields values (like password confirmation)
angular.module('WooLab').directive("fieldCompareTo", () ->
    require: 
        "ngModel"
    scope:
        otherModelValue: 
            "=fieldCompareTo"
    link:
        (scope, element, attributes, ngModel)->
            ngModel.$validators.fieldCompareTo = (modelValue) ->
                modelValue == scope.otherModelValue.$modelValue
            scope.$watch('otherModelValue', ->
                ngModel.$validate()
                return
            )
            return
)