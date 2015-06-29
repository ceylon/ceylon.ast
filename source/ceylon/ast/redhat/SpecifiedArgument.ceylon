import ceylon.ast.core {
    Node,
    SpecifiedArgument,
    ValueSpecification,
    LazySpecifier,
    FunctionArgument,
    LazySpecification,
    ValueArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared SpecifiedArgument specifiedArgumentToCeylon(JNamedArgument specifiedArgument, Anything(JNode,Node) update = noop) {
    SpecifiedArgument result;
    if (is JSpecifiedArgument specifiedArgument) {
        value valueSpecification = ValueSpecification(lIdentifierToCeylon(specifiedArgument.identifier, update), specifierToCeylon(specifiedArgument.specifierExpression, update));
        update(specifiedArgument, valueSpecification);
        result = SpecifiedArgument(valueSpecification);
    } else {
        assert (is JTypedArgument specifiedArgument, exists type = specifiedArgument.type, !type.mainToken exists);
        if (type is JFunctionModifier) {
            assert (is FunctionArgument functionArgument = inlineDefinitionArgumentToCeylon(specifiedArgument, update));
            assert (is LazySpecifier definition = functionArgument.definition);
            value lazySpecification = LazySpecification {
                name = functionArgument.name;
                parameterLists = functionArgument.parameterLists;
                specifier = definition;
            };
            update(specifiedArgument, lazySpecification);
            result = SpecifiedArgument(lazySpecification);
        } else {
            assert (type is JValueModifier);
            assert (is ValueArgument valueArgument = inlineDefinitionArgumentToCeylon(specifiedArgument, update));
            assert (is LazySpecifier definition = valueArgument.definition);
            value lazySpecification = LazySpecification {
                name = valueArgument.name;
                parameterLists = [];
                specifier = definition;
            };
            update(specifiedArgument, lazySpecification);
            result = SpecifiedArgument(lazySpecification);
        }
    }
    update(specifiedArgument, result);
    return result;
}

"Compiles the given [[code]] for a Specified Argument
 into a [[SpecifiedArgument]] using the Ceylon compiler
 (more specifically, the rule for a `namedArgument`)."
shared SpecifiedArgument? compileSpecifiedArgument(String code, Anything(JNode,Node) update = noop) {
    if (exists jNamedArgument = createParser(code).namedArgument()) {
        try {
            return specifiedArgumentToCeylon(jNamedArgument, update);
        } catch (AssertionError e) {
            return null;
        }
    } else {
        return null;
    }
}
