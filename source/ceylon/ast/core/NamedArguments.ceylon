"A named argument list.
 
 Any number of named arguments, followed by a (possibly empty) ordinary list of arguments.
 
 Examples:
 
     {}
     { name; size = width * height; }
     {
         Head { title = pageTitle; }
         Body {
             for (paragraph in paragraphs)
                 P(paragraph)
         }
     }"
shared class NamedArguments(namedArguments = [], iterableArgument = ArgumentList())
        extends Arguments() {
    
    "The named arguments."
    shared NamedArgument[] namedArguments;
    "The trailing argument list.
     
     This argument list is interpreted as a single
     argument to a parameter of type [[Iterable]]."
    shared ArgumentList iterableArgument;
    
    shared actual <NamedArgument|ArgumentList>[] children = concatenate(namedArguments, [iterableArgument]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNamedArguments(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitNamedArguments(this);

    shared actual Boolean equals(Object that) {
        if (is NamedArguments that) {
            return namedArguments == that.namedArguments && iterableArgument == that.iterableArgument;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (namedArguments.hash + 31 * iterableArgument.hash);
    
    shared NamedArguments copy(NamedArgument[] namedArguments = this.namedArguments, ArgumentList iterableArgument = this.iterableArgument) {
        value ret = NamedArguments(namedArguments, iterableArgument);
        copyExtraInfoTo(ret);
        return ret;
    }
}
