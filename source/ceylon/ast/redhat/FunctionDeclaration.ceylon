import ceylon.ast.core {
    Annotations,
    DynamicModifier,
    FunctionDeclaration,
    Type,
    TypeConstraint,
    TypeParameters,
    VoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JMethodDeclaration=MethodDeclaration,
        JStaticType=StaticType,
        JVoidModifier=VoidModifier
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[MethodDeclaration|JMethodDeclaration]] to a `ceylon.ast` [[FunctionDeclaration]]."
shared FunctionDeclaration functionDeclarationToCeylon(JMethodDeclaration functionDeclaration) {
    "Must not have a specification"
    assert (!functionDeclaration.specifierExpression exists);
    assert (is JStaticType|JVoidModifier|JDynamicModifier jType = functionDeclaration.type);
    Type|VoidModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType); }
    TypeParameters? typeParameters;
    if (exists jTypeParameterList = functionDeclaration.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameterList);
    } else {
        typeParameters = null;
    }
    assert (nonempty parameterLists = CeylonIterable(functionDeclaration.parameterLists).collect(parametersToCeylon));
    Annotations annotations;
    if (exists jAnnotationList = functionDeclaration.annotationList) {
        annotations = annotationsToCeylon(jAnnotationList);
    } else {
        annotations = Annotations();
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraintList = functionDeclaration.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraintList.typeConstraints).collect(typeConstraintToCeylon);
    } else {
        typeConstraints = [];
    }
    return FunctionDeclaration {
        name = lIdentifierToCeylon(functionDeclaration.identifier);
        type = type;
        parameterLists = parameterLists;
        typeParameters = typeParameters;
        typeConstraints = typeConstraints;
        annotations = annotations;
    };
}

"Compiles the given [[code]] for a Function Declaration
 into a [[FunctionDeclaration]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared FunctionDeclaration? compileFunctionDeclaration(String code) {
    if (is JMethodDeclaration jDeclaration = createParser(code).declaration(),
        !jDeclaration.specifierExpression exists) {
        return functionDeclarationToCeylon(jDeclaration);
    } else {
        return null;
    }
}
