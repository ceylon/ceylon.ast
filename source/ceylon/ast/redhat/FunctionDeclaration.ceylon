import ceylon.ast.core {
    Annotations,
    FunctionDeclaration,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared FunctionDeclaration functionDeclarationToCeylon(JMethodDeclaration functionDeclaration, Anything(JNode, Node) update = noop) {
    "Must not have a specification"
    assert (!functionDeclaration.specifierExpression exists);
    value result = FunctionDeclaration {
        name = lIdentifierToCeylon(functionDeclaration.identifier, update);
        value type {
            assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = functionDeclaration.type);
            switch (jType)
            case (is JStaticType) { return typeToCeylon(jType, update); }
            case (is JVoidModifier) { return voidModifierToCeylon(jType, update); }
            case (is JFunctionModifier) { return functionModifierToCeylon(jType, update); }
            case (is JDynamicModifier) { return dynamicModifierToCeylon(jType, update); }
        }
        value parameterLists {
            assert (nonempty parameterLists = CeylonIterable(functionDeclaration.parameterLists).collect(propagateUpdate(parametersToCeylon, update)));
            return parameterLists;
        }
        value typeParameters {
            if (exists jTypeParameterList = functionDeclaration.typeParameterList) {
                return typeParametersToCeylon(jTypeParameterList, update);
            } else {
                return null;
            }
        }
        value typeConstraints {
            if (exists jTypeConstraintList = functionDeclaration.typeConstraintList) {
                return CeylonIterable(jTypeConstraintList.typeConstraints).collect(propagateUpdate(typeConstraintToCeylon, update));
            } else {
                return [];
            }
        }
        value annotations {
            if (exists jAnnotationList = functionDeclaration.annotationList) {
                return annotationsToCeylon(jAnnotationList, update);
            } else {
                return Annotations();
            }
        }
    };
    update(functionDeclaration, result);
    return result;
}

"Parses the given [[code]] for a Function Declaration
 into a [[FunctionDeclaration]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared FunctionDeclaration? parseFunctionDeclaration(String code, Anything(JNode, Node) update = noop) {
    if (is JMethodDeclaration jDeclaration = createParser(code).declaration(),
        !jDeclaration.specifierExpression exists) {
        return functionDeclarationToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
