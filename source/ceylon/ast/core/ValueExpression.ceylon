"An expression that returns an ordinary value.
 
 Value expressions return instances of classes, while [[function expressions|FunctionExpression]] return first-class functions."
shared abstract class ValueExpression()
        of Primary | Operation
        extends Expression() {
}
