"A subscript used to access an element or subrange
 in a [[ElementOrSubrangeExpression]] (where it is surrounded by brackets).
 
 In mathematical notations, these accessors are usually written as subscript,
 e. g. *x<sub>i</sub>* for the *i*<sup>th</sup> *x* element.
 
 Examples:
 
     index
     ... text.size - 2"
shared abstract class Subscript()
        of KeySubscript | RangeSubscript
        extends ExpressionIsh() {
}
