import ceylon.ast.core {
    ArgumentList,
    Comprehension,
    Expression,
    PositionalArguments,
    SpreadArgument,
    This
}

shared alias PositionalArgumentIsh => Expression|SpreadArgument|Comprehension;

"""A utility function to create [[PositionalArguments]] directly from a list of
   expressions, spread arguments and comprehensions, without having to use
   [[ArgumentList]] and having to wrap the [[listed arguments|ArgumentList.listedArguments]]
   in a sequence.
   
   Usage examples:
   
       positionalArguments()
       positionalArguments(This(), SpreadArgument(baseExpression("others")))"""
shared PositionalArguments positionalArguments(PositionalArgumentIsh* arguments) {
    Expression assertIsExpression(PositionalArgumentIsh argument) {
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
