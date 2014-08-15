import ceylon.ast.core {
    Annotations,
    DynamicModifier,
    FunctionModifier,
    FunctionShortcutDefinition,
    Type,
    TypeConstraint,
    TypeParameters,
    VoidModifier
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
shared FunctionShortcutDefinition functionShortcutDefinitionToCeylon(JMethodDeclaration functionShortcutDefinition) {
    assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = functionShortcutDefinition.type);
    Type|VoidModifier|FunctionModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType); }
    case (is JFunctionModifier) { type = functionModifierToCeylon(jType); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType); }
    TypeParameters? typeParameters;
    if (exists jTypeParameterList = functionShortcutDefinition.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameterList);
    } else {
        typeParameters = null;
    }
    assert (nonempty parameterLists = CeylonIterable(functionShortcutDefinition.parameterLists).collect(parametersToCeylon));
    Annotations annotations;
    if (exists jAnnotationList = functionShortcutDefinition.annotationList) {
        annotations = annotationsToCeylon(jAnnotationList);
    } else {
        annotations = Annotations();
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraintList = functionShortcutDefinition.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraintList.typeConstraints).collect(typeConstraintToCeylon);
    } else {
        typeConstraints = [];
    }
    assert (is JLazySpecifierExpression jSpecifierExpression = functionShortcutDefinition.specifierExpression);
    return FunctionShortcutDefinition {
        name = lIdentifierToCeylon(functionShortcutDefinition.identifier);
        type = type;
        parameterLists = parameterLists;
        definition = lazySpecifierToCeylon(jSpecifierExpression);
        typeParameters = typeParameters;
        typeConstraints = typeConstraints;
        annotations = annotations;
    };
}

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
