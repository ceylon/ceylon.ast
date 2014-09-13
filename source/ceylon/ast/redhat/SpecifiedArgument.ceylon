import ceylon.ast.core {
    SpecifiedArgument,
    ValueSpecification,
    LazySpecifier,
    FunctionArgument,
    LazySpecification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionModifier=FunctionModifier,
        JNamedArgument=NamedArgument,
        JSpecifiedArgument=SpecifiedArgument,
        JTypedArgument=TypedArgument
    }
}

"Converts a RedHat AST [[NamedArgument|JNamedArgument]] to a `ceylon.ast` [[SpecifiedArgument]].
 
 The main RedHat AST type for specified arguments is [[SpecifiedArgument|JSpecifiedArgument]];
 however, a lazy function specification like
 
     comparing(Integer x, Integer y) => x.magnitude <=> y.magnitude;
 
 is instead parsed as a [[FunctionArgument|Tree.FunctionArgument]] with a synthetic
 ‘`function`’ modifier (`null` token)."
shared SpecifiedArgument specifiedArgumentToCeylon(JNamedArgument specifiedArgument) {
    if (is JSpecifiedArgument specifiedArgument) {
        return SpecifiedArgument(ValueSpecification(lIdentifierToCeylon(specifiedArgument.identifier), specifierToCeylon(specifiedArgument.specifierExpression)));
    } else {
        assert (is JTypedArgument specifiedArgument, exists type = specifiedArgument.type, type is JFunctionModifier, !specifiedArgument.type.mainToken exists);
        assert (is FunctionArgument functionArgument = inlineDefinitionArgumentToCeylon(specifiedArgument));
        assert (is LazySpecifier definition = functionArgument.definition);
        return SpecifiedArgument(LazySpecification {
                name = functionArgument.name;
                parameterLists = functionArgument.parameterLists;
                specifier = definition;
            });
    }
}

"Compiles the given [[code]] for a Specified Argument
 into a [[SpecifiedArgument]] using the Ceylon compiler
 (more specifically, the rule for a `namedArgument`)."
shared SpecifiedArgument? compileSpecifiedArgument(String code) {
    if (exists jNamedArgument = createParser(code).namedArgument()) {
        try {
            return specifiedArgumentToCeylon(jNamedArgument);
        } catch (AssertionError e) {
            return null;
        }
    } else {
        return null;
    }
}
