import ceylon.ast.core {
    ArgumentList,
    Expression,
    SpreadArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComprehension=Comprehension,
        JListedArgument=ListedArgument,
        JPositionalArgument=PositionalArgument,
        JSequencedArgument=SequencedArgument,
        JSpreadArgument=SpreadArgument
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[SequencedArgument|JSequencedArgument]] to a `ceylon.ast` [[ArgumentList]].
 
 (The RedHat AST [[ArgumentList|com.redhat.ceylon.compiler.typechecker.tree::Tree.ArgumentList]]
 does *not* correspond to the `ceylon.ast` [[ArgumentList]]!)"
shared ArgumentList argumentListToCeylon(JSequencedArgument argumentList) {
    value arguments = CeylonIterable(argumentList.positionalArguments).sequence();
    if (exists lastArgument = arguments.last) {
        assert (is JListedArgument|JSpreadArgument|JComprehension lastArgument);
        Expression listedArgumentToCeylon(JPositionalArgument positionalArgument) {
            assert (is JListedArgument positionalArgument);
            return expressionToCeylon(positionalArgument.expression);
        }
        switch (lastArgument)
        case (is JListedArgument) {
            // only listed arguments
            return ArgumentList(arguments.collect(listedArgumentToCeylon));
        }
        case (is JSpreadArgument) {
            SpreadArgument spreadArgument = spreadArgumentToCeylon(lastArgument);
            return ArgumentList(arguments.reversed.rest.reversed.collect(listedArgumentToCeylon), spreadArgument);
            // don’t worry, sequence.reversed is backed by the original sequence – this shouldn’t be slower than it needs to be
        }
        case (is JComprehension) {
            throw AssertionError("Comprehensions not yet supported!"); // TODO use comprehensionToCeylon when added
        }
    } else {
        // empty argument list
        return ArgumentList();
    }
}

"Compiles the given [[code]] for an Argument List
 into an [[ArgumentList]] using the Ceylon compiler
 (more specifically, the rule for a `sequencedArgument`)."
shared ArgumentList? compileArgumentList(String code) {
    if (exists jSequencedArgument = createParser(code).sequencedArgument()) {
        return argumentListToCeylon(jSequencedArgument);
    } else {
        return null;
    }
}
