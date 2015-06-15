import ceylon.ast.core {
    Node,
    ValueGetterDefinition,
    Type,
    DynamicModifier,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAttributeGetterDefinition=AttributeGetterDefinition,
        JDynamicModifier=DynamicModifier,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[AttributeGetterDefinition|JAttributeGetterDefinition]] to a `ceylon.ast` [[ValueGetterDefinition]]."
shared ValueGetterDefinition valueGetterDefinitionToCeylon(JAttributeGetterDefinition valueGetterDefinition, Anything(JNode,Node) update = noop) {
    "Must be defined"
    assert (exists definition = valueGetterDefinition.block);
    assert (is JStaticType|JValueModifier|JDynamicModifier jType = valueGetterDefinition.type);
    Type|ValueModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType, update); }
    case (is JValueModifier) { type = valueModifierToCeylon(jType, update); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType, update); }
    value result = ValueGetterDefinition {
        annotations = annotationsToCeylon(valueGetterDefinition.annotationList, update);
        type = type;
        name = lIdentifierToCeylon(valueGetterDefinition.identifier, update);
        definition = blockToCeylon(definition, update);
    };
    update(valueGetterDefinition, result);
    return result;
}

"Compiles the given [[code]] for a Value Getter Definition
 into a [[ValueGetterDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ValueGetterDefinition? compileValueGetterDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JAttributeGetterDefinition jDeclaration = createParser(code).declaration()) {
        return valueGetterDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
