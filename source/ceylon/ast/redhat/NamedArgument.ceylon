import ceylon.ast.core {
    NamedArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
shared NamedArgument namedArgumentToCeylon(JNamedArgument namedArgument) {
    assert (is JSpecifiedArgument|JTypedArgument namedArgument);
    switch (namedArgument)
    case (is JSpecifiedArgument) {
        if (!namedArgument.identifier exists) {
            // anonymous argument
            return anonymousArgumentToCeylon(namedArgument);
        } else {
            // specified argument
            return specifiedArgumentToCeylon(namedArgument);
        }
    }
    case (is JTypedArgument) {
        if (exists type = namedArgument.type, !type.mainToken exists, type is JFunctionModifier|JValueModifier, !namedArgument is JObjectArgument) {
            // lazy specified arguments are parsed as value / function definitions with synthetic ‘value’ / ‘function’ modifiers
            return specifiedArgumentToCeylon(namedArgument);
        } else {
            // inline definition argument
            return inlineDefinitionArgumentToCeylon(namedArgument);
        }
    }
}

"Compiles the given [[code]] for a Named Argument
 into a [[NamedArgument]] using the Ceylon compiler
 (more specifically, the rules for a `namedArgument` and for an `anonymousArgument`)."
shared NamedArgument? compileNamedArgument(String code) {
    if (exists jNamedArgument = createParser(code).namedArgument()) {
        return namedArgumentToCeylon(jNamedArgument);
    } else if (exists jAnonymousArgument = createParser(code).anonymousArgument()) {
        return namedArgumentToCeylon(jAnonymousArgument);
    } else {
        return null;
    }
}
