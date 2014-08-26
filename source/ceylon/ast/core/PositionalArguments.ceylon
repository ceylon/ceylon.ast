"A positional argument list.
 
 A list of arguments where the mapping from an argument to its parameter
 is based only on the position of the argument. Syntactically, this is
 just a wrapper for an [[ArgumentList]], enclosed in parentheses.
 
 (To create `PositionalArguments`, consider using the [[positionalArguments]]
 utility function in order to make your code more readable.)
 
 Examples:
 
     (x, y, *messages)
     ()
     (for (i in 1..10) i^2)"
shared class PositionalArguments(argumentList)
        extends Arguments() {
    
    "The enclosed argument list."
    shared ArgumentList argumentList;
    
    shared actual [ArgumentList] children = [argumentList];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPositionalArguments(this);
    
    shared actual Boolean equals(Object that) {
        if (is PositionalArguments that) {
            return argumentList == that.argumentList;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * argumentList.hash;
    
    shared PositionalArguments copy(ArgumentList argumentList = this.argumentList) {
        value ret = PositionalArguments(argumentList);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"""A utility function to create [[PositionalArguments]] directly from a list of
   expressions, spread arguments and comprehensions, without having to use
   [[ArgumentList]] and having to wrap the [[listed arguments|ArgumentList.listedArguments]]
   in a sequence.
   
   Usage examples:
   
       positionalArguments()
       positionalArguments(thisInstance, spreadArgument(baseExpression("others")))"""
shared PositionalArguments positionalArguments(<Expression|SpreadArgument|Comprehension>* arguments) {
    Expression assertIsExpression(Expression|SpreadArgument|Comprehension argument) {
        "Intermediate argument must be expression"
        assert (is Expression argument);
        return argument;
    }
    if (is SpreadArgument|Comprehension sequenceArgument = arguments.last) {
        Expression[] listedArguments = arguments[... arguments.size - 2].collect(assertIsExpression);
        return PositionalArguments(ArgumentList(listedArguments, sequenceArgument));
    } else {
        Expression[] listedArguments = arguments.collect(assertIsExpression);
        return PositionalArguments(ArgumentList(listedArguments));
    }
}
