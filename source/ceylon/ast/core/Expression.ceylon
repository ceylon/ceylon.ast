"Abstract superclass of all expression nodes."
// TODO document the expression hierarchy as soon as some members of that hierarchy are actually implemented
shared abstract class Expression(children)
        of ValueExpression // TODO other case types
        extends Node(children) {
    shared actual Expression[] children;
}
