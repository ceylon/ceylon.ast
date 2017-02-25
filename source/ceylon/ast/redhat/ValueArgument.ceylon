import ceylon.ast.core {
    Node,
    Specifier,
    ValueArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared ValueArgument valueArgumentToCeylon(JAttributeArgument valueArgument, Anything(JNode, Node) update = noop) {
    value result = ValueArgument {
        name = lIdentifierToCeylon(valueArgument.identifier, update);
        value type {
            assert (is JStaticType|JValueModifier|JDynamicModifier jType = valueArgument.type);
            switch (jType)
            case (is JStaticType) { return typeToCeylon(jType, update); }
            case (is JValueModifier) { return valueModifierToCeylon(jType, update); }
            case (is JDynamicModifier) { return dynamicModifierToCeylon(jType, update); }
        }
        value definition {
            if (exists jBlock = valueArgument.block) {
                "Value argument can’t have both a block and a specifier"
                assert (!valueArgument.specifierExpression exists);
                return blockToCeylon(jBlock, update);
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
                    value result = Specifier(expressionToCeylon(jSpecifierExpression.expression, update));
                    update(jSpecifierExpression, result);
                    return result;
                } else {
                    assert (is JLazySpecifierExpression jSpecifierExpression);
                    return lazySpecifierToCeylon(jSpecifierExpression, update);
                }
            }
        }
    };
    update(valueArgument, result);
    return result;
}

"Parses the given [[code]] for a Value Argument
 into a [[ValueArgument]] using the Ceylon compiler
 (more specifically, the rule for a `namedArgumentDeclaration`)."
shared ValueArgument? parseValueArgument(String code, Anything(JNode, Node) update = noop) {
    if (is JAttributeArgument jNamedArgumentDeclaration = createParser(code).namedArgumentDeclaration()) {
        return valueArgumentToCeylon(jNamedArgumentDeclaration, update);
    } else {
        return null;
    }
}
