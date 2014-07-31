import ceylon.ast.core {
    AnyAttribute
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyAttribute=AnyAttribute,
        JAttributeDeclaration=AttributeDeclaration
    }
}

"Converts a RedHat AST [[AnyAttribute|JAnyAttribute]] to a `ceylon.ast` [[AnyAttribute]]."
shared AnyAttribute anyAttributeToCeylon(JAnyAttribute anyAttribute) {
    assert (is JAttributeDeclaration anyAttribute);
    switch (anyAttribute)
    case (is JAttributeDeclaration) {
        if (anyAttribute.specifierOrInitializerExpression exists) {
            return attributeDefinitionToCeylon(anyAttribute);
        } else {
            return attributeDeclarationToCeylon(anyAttribute);
        }
    }
}

"Compiles the given [[code]] for an Any Attribute
 into an [[AnyAttribute]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AnyAttribute? compileAnyAttribute(String code) {
    if (is JAnyAttribute jDeclaration = createParser(code).declaration()) {
        return anyAttributeToCeylon(jDeclaration);
    } else {
        return null;
    }
}
