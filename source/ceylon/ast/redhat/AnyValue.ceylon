import ceylon.ast.core {
    AnyValue
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyAttribute=AnyAttribute,
        JAttributeDeclaration=AttributeDeclaration
    }
}

"Converts a RedHat AST [[AnyAttribute|JAnyAttribute]] to a `ceylon.ast` [[AnyValue]]."
shared AnyValue anyValueToCeylon(JAnyAttribute anyValue) {
    assert (is JAttributeDeclaration anyValue);
    switch (anyValue)
    case (is JAttributeDeclaration) {
        if (anyValue.specifierOrInitializerExpression exists) {
            return valueDefinitionToCeylon(anyValue);
        } else {
            return valueDeclarationToCeylon(anyValue);
        }
    }
}

"Compiles the given [[code]] for Any Value
 into an [[AnyValue]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AnyValue? compileAnyValue(String code) {
    if (is JAnyAttribute jDeclaration = createParser(code).declaration()) {
        return anyValueToCeylon(jDeclaration);
    } else {
        return null;
    }
}
