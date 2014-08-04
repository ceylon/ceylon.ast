import ceylon.ast.core {
    FunctionDefinition,
    FunctionModifier,
    TypeConstraint,
    VoidModifier,
    TypeParameters,
    Type,
    DynamicModifier,
    Annotations
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JFunctionModifier=FunctionModifier,
        JMethodDefinition=MethodDefinition,
        JStaticType=StaticType,
        JVoidModifier=VoidModifier
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[MethodDefinition|JMethodDefinition]] to a `ceylon.ast` [[FunctionDefinition]]."
shared FunctionDefinition functionDefinitionToCeylon(JMethodDefinition functionDefinition) {
    assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = functionDefinition.type);
    Type|VoidModifier|FunctionModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType); }
    case (is JFunctionModifier) { type = functionModifierToCeylon(jType); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType); }
    TypeParameters? typeParameters;
    if (exists jTypeParameterList = functionDefinition.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameterList);
    } else {
        typeParameters = null;
    }
    assert (nonempty parameterLists = CeylonIterable(functionDefinition.parameterLists).collect(parametersToCeylon));
    Annotations annotations;
    if (exists jAnnotationList = functionDefinition.annotationList) {
        annotations = annotationsToCeylon(jAnnotationList);
    } else {
        annotations = Annotations();
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraintList = functionDefinition.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraintList.typeConstraints).collect(typeConstraintToCeylon);
    } else {
        typeConstraints = [];
    }
    return FunctionDefinition {
        name = lIdentifierToCeylon(functionDefinition.identifier);
        type = type;
        parameterLists = parameterLists;
        definition = blockToCeylon(functionDefinition.block);
        typeParameters = typeParameters;
        typeConstraints = typeConstraints;
        annotations = annotations;
    };
}

"Compiles the given [[code]] for a Function Definition
 into a [[FunctionDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared FunctionDefinition? compileFunctionDefinition(String code) {
    if (is JMethodDefinition jDeclaration = createParser(code).declaration()) {
        return functionDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}
