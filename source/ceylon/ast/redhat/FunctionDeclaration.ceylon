import ceylon.ast.core {
    Annotations,
    FunctionDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicModifier=DynamicModifier,
        JFunctionModifier=FunctionModifier,
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
    return FunctionDeclaration {
        name = lIdentifierToCeylon(functionDeclaration.identifier);
        value type {
            assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = functionDeclaration.type);
            switch (jType)
            case (is JStaticType) { return typeToCeylon(jType); }
            case (is JVoidModifier) { return voidModifierToCeylon(jType); }
            case (is JFunctionModifier) { return functionModifierToCeylon(jType); }
            case (is JDynamicModifier) { return dynamicModifierToCeylon(jType); }
        }
        value parameterLists {
            assert (nonempty parameterLists = CeylonIterable(functionDeclaration.parameterLists).collect(parametersToCeylon));
            return parameterLists;
        }
        value typeParameters {
            if (exists jTypeParameterList = functionDeclaration.typeParameterList) {
                return typeParametersToCeylon(jTypeParameterList);
            } else {
                return null;
            }
        }
        value typeConstraints {
            if (exists jTypeConstraintList = functionDeclaration.typeConstraintList) {
                return CeylonIterable(jTypeConstraintList.typeConstraints).collect(typeConstraintToCeylon);
            } else {
                return [];
            }
        }
        value annotations {
            if (exists jAnnotationList = functionDeclaration.annotationList) {
                return annotationsToCeylon(jAnnotationList);
            } else {
                return Annotations();
            }
        }
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
