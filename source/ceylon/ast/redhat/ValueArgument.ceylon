import ceylon.ast.core {
    Specifier,
    ValueArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeArgument=AttributeArgument,
        JDynamicModifier=DynamicModifier,
        JLazySpecifierExpression=LazySpecifierExpression,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        specify=\iSPECIFY
    }
}

"Converts a RedHat AST [[AttributeArgument|JAttributeArgument]] to a `ceylon.ast` [[ValueArgument]]."
shared ValueArgument valueArgumentToCeylon(JAttributeArgument valueArgument) {
    return ValueArgument {
        name = lIdentifierToCeylon(valueArgument.identifier);
        value type {
            assert (is JStaticType|JValueModifier|JDynamicModifier jType = valueArgument.type);
            switch (jType)
            case (is JStaticType) { return typeToCeylon(jType); }
            case (is JValueModifier) { return valueModifierToCeylon(jType); }
            case (is JDynamicModifier) { return dynamicModifierToCeylon(jType); }
        }
        value definition {
            if (exists jBlock = valueArgument.block) {
                "Value argument can’t have both a block and a specifier"
                assert (!valueArgument.specifierExpression exists);
                return blockToCeylon(jBlock);
            } else {
                "Value argument must have either a specifier expression or a block"
                assert (exists jSpecifierExpression = valueArgument.specifierExpression);
                if (jSpecifierExpression.mainToken.type == specify) {
                    /*
                     The grammar uses the rule functionSpecifier to get the specifier.
                     That rule parses both specification (= x) and computation (=> x)
                     specifiers, but creates a LazySpecifierExpression for both of them.
                     For that reason, lazySpecifierToCeylon has an assertion that checks
                     the token type. We need to work around that, and write our own
                     eager specifier conversion.
                     */
                    return Specifier(expressionToCeylon(jSpecifierExpression.expression));
                } else {
                    assert (is JLazySpecifierExpression jSpecifierExpression);
                    return lazySpecifierToCeylon(jSpecifierExpression);
                }
            }
        }
    };
}

"Compiles the given [[code]] for a Value Argument
 into a [[ValueArgument]] using the Ceylon compiler
 (more specifically, the rule for a `namedArgumentDeclaration`)."
shared ValueArgument? compileValueArgument(String code) {
    if (is JAttributeArgument jNamedArgumentDeclaration = createParser(code).namedArgumentDeclaration()) {
        return valueArgumentToCeylon(jNamedArgumentDeclaration);
    } else {
        return null;
    }
}
