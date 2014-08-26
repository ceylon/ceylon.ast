"An argument list.
 
 A list of expressions, here called *listed arguments*,
 optionally followed by a spread argument or a comprehension.
 
 Examples:
 
     width, height
     *args
     /* empty parameter list is also allowed */
     this, *others"
shared class ArgumentList(listedArguments = [], sequenceArgument = null)
        extends ExpressionIsh() {
    
    "The regular, listed arguments."
    shared Expression[] listedArguments;
    "The optional trailing spread argument or comprehension."
    shared SpreadArgument|Comprehension? sequenceArgument;
    
    shared actual <Expression|SpreadArgument|Comprehension>[] children = concatenate(listedArguments, emptyOrSingleton(sequenceArgument));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformArgumentList(this);
    
    shared actual Boolean equals(Object that) {
        if (is ArgumentList that) {
            if (exists sequenceArgument) {
                if (exists sequenceArgument_ = that.sequenceArgument) {
                    return sequenceArgument == sequenceArgument_ && listedArguments == that.listedArguments;
                } else {
                    return false;
                }
            } else {
                if (!(that.sequenceArgument exists)) {
                    return listedArguments == that.listedArguments;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (listedArguments.hash + 31 * (sequenceArgument?.hash else 0));
    
    shared ArgumentList copy(Expression[] listedArguments = this.listedArguments, SpreadArgument|Comprehension? sequenceArgument = this.sequenceArgument) {
        value ret = ArgumentList(listedArguments, sequenceArgument);
        copyExtraInfoTo(ret);
        return ret;
    }
}
