import ceylon.ast.core {
    FunctionDefinition,
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
shared FunctionDefinition functionDefinitionToCeylon(JMethodDefinition functionDefinition)
        => FunctionDefinition {
    name = lIdentifierToCeylon(functionDefinition.identifier);
    value type {
        assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = functionDefinition.type);
        switch (jType)
        case (is JStaticType) { return typeToCeylon(jType); }
        case (is JVoidModifier) { return voidModifierToCeylon(jType); }
        case (is JFunctionModifier) { return functionModifierToCeylon(jType); }
        case (is JDynamicModifier) { return dynamicModifierToCeylon(jType); }
    }
    value parameterLists {
        assert (nonempty parameterLists = CeylonIterable(functionDefinition.parameterLists).collect(parametersToCeylon));
        return parameterLists;
    }
    definition = blockToCeylon(functionDefinition.block);
    value typeParameters {
        if (exists jTypeParameterList = functionDefinition.typeParameterList) {
            return typeParametersToCeylon(jTypeParameterList);
        } else {
            return null;
        }
    }
    value typeConstraints {
        if (exists jTypeConstraintList = functionDefinition.typeConstraintList) {
            return CeylonIterable(jTypeConstraintList.typeConstraints).collect(typeConstraintToCeylon);
        } else {
            return [];
        }
    }
    value annotations {
        if (exists jAnnotationList = functionDefinition.annotationList) {
            return annotationsToCeylon(jAnnotationList);
        } else {
            return Annotations();
        }
    }
};

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
