import ceylon.ast.core {
    AnonymousArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifiedArgument=SpecifiedArgument
    }
}

"Converts a RedHat AST [[SpecifiedArgument|JSpecifiedArgument]] to a `ceylon.ast` [[AnonymousArgument]].
 
 Warning: RedHat AST’s `SpecifiedArgument` is also used for true specified arguments; this function
 does not convert those and will throw an exception instead!"
shared AnonymousArgument anonymousArgumentToCeylon(JSpecifiedArgument anonymousArgument) {
    "Must be anonymous"
    assert (!anonymousArgument.identifier exists,
        !anonymousArgument.specifierExpression.mainToken exists);
    return AnonymousArgument(expressionToCeylon(anonymousArgument.specifierExpression.expression));
}

"Compiles the given [[code]] for an Anonymous Argument
 into an [[AnonymousArgument]] using the Ceylon compiler
 (more specifically, the rule for an `anonymousArgument`)."
shared AnonymousArgument? compileAnonymousArgument(String code) {
    if (exists jAnonymousArgument = createParser(code).anonymousArgument()) {
        return anonymousArgumentToCeylon(jAnonymousArgument);
    } else {
        return null;
    }
}
