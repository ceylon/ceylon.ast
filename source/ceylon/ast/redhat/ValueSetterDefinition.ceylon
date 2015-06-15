import ceylon.ast.core {
    Block,
    LazySpecifier,
    Node,
    ValueSetterDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAttributeSetterDefinition=AttributeSetterDefinition,
        JLazySpecifierExpression=LazySpecifierExpression
    }
}

"Converts a RedHat AST [[AttributeSetterDefinition|JAttributeSetterDefinition]] to a `ceylon.ast` [[ValueSetterDefinition]]."
shared ValueSetterDefinition valueSetterDefinitionToCeylon(JAttributeSetterDefinition valueSetterDefinition, Anything(JNode,Node) update = noop) {
    Block|LazySpecifier definition;
    if (exists jBlock = valueSetterDefinition.block) {
        "Value setter definition can’t have both a block and a specifier expression"
        assert (!valueSetterDefinition.specifierExpression exists);
        definition = blockToCeylon(jBlock, update);
    } else {
        "Value setter definition must have either a block or a specifier expression"
        assert (exists jSpecifierExpression = valueSetterDefinition.specifierExpression);
        "Value setter can’t be defined using “specify” operator (`=`)"
        assert (is JLazySpecifierExpression jSpecifierExpression);
        definition = lazySpecifierToCeylon(jSpecifierExpression, update);
    }
    value result = ValueSetterDefinition(lIdentifierToCeylon(valueSetterDefinition.identifier, update), definition, annotationsToCeylon(valueSetterDefinition.annotationList, update));
    update(valueSetterDefinition, result);
    return result;
}

"Compiles the given [[code]] for a Value Setter Definition
 into a [[ValueSetterDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ValueSetterDefinition? compileValueSetterDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JAttributeSetterDefinition jDeclaration = createParser(code).declaration()) {
        return valueSetterDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
