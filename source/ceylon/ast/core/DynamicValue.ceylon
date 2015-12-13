"""A dynamic value expression, that is, the keyword ‘`dynamic`’
   followed by any number of [[named arguments|namedArguments]]
   and a (possibly empty) [[argument list|iterableArgument]],
   enclosed in brackets.
   
   Examples:
   
       dynamic [ error = 404; message = "not found"; ]
       dynamic [ ]"""
shared class DynamicValue(namedArguments = [], iterableArgument = ArgumentList(), modifier = DynamicModifier())
        extends Atom() {
    
    "The named members of the dynamic object."
    shared NamedArgument[] namedArguments;
    "The iterable members of the dynamic object."
    shared ArgumentList iterableArgument;
    "The ‘`dynamic`’ modifier keyword
     that precedes the content."
    shared DynamicModifier modifier;
    
    shared actual <NamedArgument|ArgumentList|DynamicModifier>[] children = concatenate([modifier], namedArguments, [iterableArgument]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDynamicValue(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitDynamicValue(this);

    shared actual Boolean equals(Object that) {
        if (is DynamicValue that) {
            return namedArguments == that.namedArguments && iterableArgument == that.iterableArgument && modifier == that.modifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (namedArguments.hash + 31 * (iterableArgument.hash + 31 * modifier.hash));
    
    shared DynamicValue copy(NamedArgument[] namedArguments = this.namedArguments, ArgumentList iterableArgument = this.iterableArgument, DynamicModifier modifier = this.modifier) {
        value ret = DynamicValue(namedArguments, iterableArgument, modifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
