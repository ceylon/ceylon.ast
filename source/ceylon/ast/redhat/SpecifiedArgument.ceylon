import ceylon.ast.core {
    SpecifiedArgument,
    ValueSpecification,
    LazySpecifier,
    FunctionArgument,
    LazySpecification,
    ValueArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionModifier=FunctionModifier,
        JNamedArgument=NamedArgument,
        JSpecifiedArgument=SpecifiedArgument,
        JTypedArgument=TypedArgument,
        JValueModifier=ValueModifier
    }
}

"""Converts a RedHat AST [[NamedArgument|JNamedArgument]] to a `ceylon.ast` [[SpecifiedArgument]].
   
   The main RedHat AST type for specified arguments is [[SpecifiedArgument|JSpecifiedArgument]];
   however, lazy specifications like
   
       val => "Hello, World!";
       comparing(Integer x, Integer y) => x.magnitude <=> y.magnitude;
   
   are instead parsed as [[AttributeArguments|Tree.AttributeArgument]] / [[FunctionArguments|Tree.FunctionArgument]]
   with a synthetic ‘`function`’ / ‘`value`’ modifier (`null` token)."""
shared SpecifiedArgument specifiedArgumentToCeylon(JNamedArgument specifiedArgument) {
    if (is JSpecifiedArgument specifiedArgument) {
        return SpecifiedArgument(ValueSpecification(lIdentifierToCeylon(specifiedArgument.identifier), specifierToCeylon(specifiedArgument.specifierExpression)));
    } else {
        assert (is JTypedArgument specifiedArgument, exists type = specifiedArgument.type, !type.mainToken exists);
        if (type is JFunctionModifier) {
            assert (is FunctionArgument functionArgument = inlineDefinitionArgumentToCeylon(specifiedArgument));
            assert (is LazySpecifier definition = functionArgument.definition);
            return SpecifiedArgument(LazySpecification {
                    name = functionArgument.name;
                    parameterLists = functionArgument.parameterLists;
                    specifier = definition;
                });
        } else {
            assert (type is JValueModifier);
            assert (is ValueArgument valueArgument = inlineDefinitionArgumentToCeylon(specifiedArgument));
            assert (is LazySpecifier definition = valueArgument.definition);
            return SpecifiedArgument(LazySpecification {
                    name = valueArgument.name;
                    parameterLists = [];
                    specifier = definition;
                });
        }
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
