import ceylon.ast.core {
    AnonymousArgument,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSpecifiedArgument=SpecifiedArgument
    }
}

"Converts a RedHat AST [[SpecifiedArgument|JSpecifiedArgument]] to a `ceylon.ast` [[AnonymousArgument]].
 
 Warning: RedHat AST’s `SpecifiedArgument` is also used for true specified arguments; this function
 does not convert those and will throw an exception instead!"
shared AnonymousArgument anonymousArgumentToCeylon(JSpecifiedArgument anonymousArgument, Anything(JNode,Node) update = noop) {
    "Must be anonymous"
    assert (!anonymousArgument.identifier?.mainToken exists,
        !anonymousArgument.specifierExpression.mainToken exists);
    value result = AnonymousArgument(expressionToCeylon(anonymousArgument.specifierExpression.expression, update));
    update(anonymousArgument, result);
    return result;
}

"Compiles the given [[code]] for an Anonymous Argument
 into an [[AnonymousArgument]] using the Ceylon compiler
 (more specifically, the rule for an `anonymousArgument`)."
shared AnonymousArgument? compileAnonymousArgument(String code, Anything(JNode,Node) update = noop) {
    if (exists jAnonymousArgument = createParser(code).anonymousArgument()) {
        return anonymousArgumentToCeylon(jAnonymousArgument, update);
    } else {
        return null;
    }
}
