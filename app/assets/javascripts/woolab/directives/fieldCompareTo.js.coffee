#Directive to compare two fields values (like password confirmation)

@WooLab.directive("fieldCompareTo", () ->
    require: 
        "ngModel"
    scope:
        otherModelValue: 
            "=fieldCompareTo"
    link:
        (scope, element, attributes, ngModel)->
            ngModel.$validators.fieldCompareTo = (modelValue) ->
                console.log modelValue
                console.log scope.otherModelValue.$modelValue
                modelValue == scope.otherModelValue.$modelValue
            scope.$watch('otherModelValue', ->
                ngModel.$validate()
                return
            )
            return
)