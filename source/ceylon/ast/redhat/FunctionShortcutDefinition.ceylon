import ceylon.ast.core {
    Annotations,
    FunctionShortcutDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JFunctionModifier=FunctionModifier,
        JLazySpecifierExpression=LazySpecifierExpression,
        JMethodDeclaration=MethodDeclaration,
        JStaticType=StaticType,
        JVoidModifier=VoidModifier
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[MethodDeclaration|JMethodDeclaration]] to a `ceylon.ast` [[FunctionShortcutDefinition]]."
shared FunctionShortcutDefinition functionShortcutDefinitionToCeylon(JMethodDeclaration functionShortcutDefinition)
        => FunctionShortcutDefinition {
    name = lIdentifierToCeylon(functionShortcutDefinition.identifier);
    value type {
        assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = functionShortcutDefinition.type);
        switch (jType)
        case (is JStaticType) { return typeToCeylon(jType); }
        case (is JVoidModifier) { return voidModifierToCeylon(jType); }
        case (is JFunctionModifier) { return functionModifierToCeylon(jType); }
        case (is JDynamicModifier) { return dynamicModifierToCeylon(jType); }
    }
    value parameterLists {
        assert (nonempty parameterLists = CeylonIterable(functionShortcutDefinition.parameterLists).collect(parametersToCeylon));
        return parameterLists;
    }
    value definition {
        assert (is JLazySpecifierExpression jSpecifierExpression = functionShortcutDefinition.specifierExpression);
        return lazySpecifierToCeylon(jSpecifierExpression);
    }
    value typeParameters {
        if (exists jTypeParameterList = functionShortcutDefinition.typeParameterList) {
            return typeParametersToCeylon(jTypeParameterList);
        } else {
            return null;
        }
    }
    value typeConstraints {
        if (exists jTypeConstraintList = functionShortcutDefinition.typeConstraintList) {
            return CeylonIterable(jTypeConstraintList.typeConstraints).collect(typeConstraintToCeylon);
        } else {
            return [];
        }
    }
    value annotations {
        if (exists jAnnotationList = functionShortcutDefinition.annotationList) {
            return annotationsToCeylon(jAnnotationList);
        } else {
            return Annotations();
        }
    }
};

"Compiles the given [[code]] for a Function Shortcut Definition
 into a [[FunctionShortcutDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared FunctionShortcutDefinition? compileFunctionShortcutDefinition(String code) {
    if (is JMethodDeclaration jDeclaration = createParser(code).declaration(),
        jDeclaration.specifierExpression exists) {
        return functionShortcutDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}
