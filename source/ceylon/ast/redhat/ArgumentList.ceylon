import ceylon.ast.core {
    ArgumentList,
    Comprehension,
    Expression,
    Node,
    SpreadArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared ArgumentList argumentListToCeylon(JSequencedArgument argumentList, Anything(JNode,Node) update = noop) {
    value arguments = CeylonIterable(argumentList.positionalArguments).sequence();
    ArgumentList result;
    if (exists lastArgument = arguments.last) {
        assert (is JListedArgument|JSpreadArgument|JComprehension lastArgument);
        Expression listedArgumentToCeylon(JPositionalArgument positionalArgument, Anything(JNode,Node) update = noop) {
            assert (is JListedArgument positionalArgument);
            return expressionToCeylon(positionalArgument.expression, update);
        }
        switch (lastArgument)
        case (is JListedArgument) {
            // only listed arguments
            result = ArgumentList(arguments.collect(propagateUpdate(listedArgumentToCeylon, update)));
        }
        case (is JSpreadArgument) {
            SpreadArgument spreadArgument = spreadArgumentToCeylon(lastArgument, update);
            result = ArgumentList(arguments.reversed.rest.reversed.collect(propagateUpdate(listedArgumentToCeylon, update)), spreadArgument);
            // don’t worry, sequence.reversed is backed by the original sequence – this shouldn’t be slower than it needs to be
        }
        case (is JComprehension) {
            Comprehension comprehension = comprehensionToCeylon(lastArgument, update);
            result = ArgumentList(arguments.reversed.rest.reversed.collect(propagateUpdate(listedArgumentToCeylon, update)), comprehension);
        }
    } else {
        // empty argument list
        result = ArgumentList();
    }
    update(argumentList, result);
    return result;
}

"Parses the given [[code]] for an Argument List
 into an [[ArgumentList]] using the Ceylon compiler
 (more specifically, the rule for a `sequencedArgument`)."
shared ArgumentList? parseArgumentList(String code, Anything(JNode,Node) update = noop) {
    if (exists jSequencedArgument = createParser(code).sequencedArgument()) {
        return argumentListToCeylon(jSequencedArgument, update);
    } else {
        return null;
    }
}
