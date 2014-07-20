import ceylon.ast.core {
    SpecifiedArgument,
    ValueSpecification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifiedArgument=SpecifiedArgument
    }
}

"Converts a RedHat AST [[SpecifiedArgument|JSpecifiedArgument]] to a `ceylon.ast` [[SpecifiedArgument]]."
shared SpecifiedArgument specifiedArgumentToCeylon(JSpecifiedArgument specifiedArgument) {
    return SpecifiedArgument(ValueSpecification(lIdentifierToCeylon(specifiedArgument.identifier), specifierToCeylon(specifiedArgument.specifierExpression)));
}

"Compiles the given [[code]] for a Specified Argument
 into a [[SpecifiedArgument]] using the Ceylon compiler
 (more specifically, the rule for a `namedSpecifiedArgument`)."
shared SpecifiedArgument? compileSpecifiedArgument(String code) {
    if (exists jSpecifiedArgument = createParser(code).namedSpecifiedArgument()) {
        return specifiedArgumentToCeylon(jSpecifiedArgument);
    } else {
        return null;
    }
}
