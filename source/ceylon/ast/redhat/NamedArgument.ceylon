import ceylon.ast.core {
    NamedArgument,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionModifier=FunctionModifier,
        JNamedArgument=NamedArgument,
        JObjectArgument=ObjectArgument,
        JSpecifiedArgument=SpecifiedArgument,
        JTypedArgument=TypedArgument,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[NamedArgument|JNamedArgument]] to a `ceylon.ast` [[NamedArgument]]."
shared NamedArgument namedArgumentToCeylon(JNamedArgument namedArgument, Anything(JNode,Node) update = noop) {
    assert (is JSpecifiedArgument|JTypedArgument namedArgument);
    switch (namedArgument)
    case (is JSpecifiedArgument) {
        if (!namedArgument.identifier exists) {
            // anonymous argument
            return anonymousArgumentToCeylon(namedArgument, update);
        } else {
            // specified argument
            return specifiedArgumentToCeylon(namedArgument, update);
        }
    }
    case (is JTypedArgument) {
        if (exists type = namedArgument.type, !type.mainToken exists, type is JFunctionModifier|JValueModifier, !namedArgument is JObjectArgument) {
            // lazy specified arguments are parsed as value / function definitions with synthetic ‘value’ / ‘function’ modifiers
            return specifiedArgumentToCeylon(namedArgument, update);
        } else {
            // inline definition argument
            return inlineDefinitionArgumentToCeylon(namedArgument, update);
        }
    }
}

"Compiles the given [[code]] for a Named Argument
 into a [[NamedArgument]] using the Ceylon compiler
 (more specifically, the rules for a `namedArgument` and for an `anonymousArgument`)."
shared NamedArgument? compileNamedArgument(String code, Anything(JNode,Node) update = noop) {
    if (exists jNamedArgument = createParser(code).namedArgument()) {
        return namedArgumentToCeylon(jNamedArgument, update);
    } else if (exists jAnonymousArgument = createParser(code).anonymousArgument()) {
        return namedArgumentToCeylon(jAnonymousArgument, update);
    } else {
        return null;
    }
}
