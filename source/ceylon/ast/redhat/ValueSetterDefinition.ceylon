import ceylon.ast.core {
    ValueSetterDefinition,
    Block,
    LazySpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeSetterDefinition=AttributeSetterDefinition,
        JLazySpecifierExpression=LazySpecifierExpression
    }
}

"Converts a RedHat AST [[AttributeSetterDefinition|JAttributeSetterDefinition]] to a `ceylon.ast` [[ValueSetterDefinition]]."
shared ValueSetterDefinition valueSetterDefinitionToCeylon(JAttributeSetterDefinition valueSetterDefinition) {
    Block|LazySpecifier definition;
    if (exists jBlock = valueSetterDefinition.block) {
        "Value setter definition can’t have both a block and a specifier expression"
        assert (!valueSetterDefinition.specifierExpression exists);
        definition = blockToCeylon(jBlock);
    } else {
        "Value setter definition must have either a block or a specifier expression"
        assert (exists jSpecifierExpression = valueSetterDefinition.specifierExpression);
        "Value setter can’t be defined using “specify” operator (`=`)"
        assert (is JLazySpecifierExpression jSpecifierExpression);
        definition = lazySpecifierToCeylon(jSpecifierExpression);
    }
    return ValueSetterDefinition(lIdentifierToCeylon(valueSetterDefinition.identifier), definition, annotationsToCeylon(valueSetterDefinition.annotationList));
}

"Compiles the given [[code]] for a Value Setter Definition
 into a [[ValueSetterDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ValueSetterDefinition? compileValueSetterDefinition(String code) {
    if (is JAttributeSetterDefinition jDeclaration = createParser(code).declaration()) {
        return valueSetterDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}
