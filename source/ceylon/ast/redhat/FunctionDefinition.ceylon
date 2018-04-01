import ceylon.ast.core {
    FunctionDefinition,
    Annotations,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared FunctionDefinition functionDefinitionToCeylon(JMethodDefinition functionDefinition, Anything(JNode, Node) update = noop) {
    value result = FunctionDefinition {
        name = lIdentifierToCeylon(functionDefinition.identifier, update);
        value type {
            assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = functionDefinition.type);
            switch (jType)
            case (is JStaticType) { return typeToCeylon(jType, update); }
            case (is JVoidModifier) { return voidModifierToCeylon(jType, update); }
            case (is JFunctionModifier) { return functionModifierToCeylon(jType, update); }
            case (is JDynamicModifier) { return dynamicModifierToCeylon(jType, update); }
        }
        value parameterLists {
            assert (nonempty parameterLists = CeylonIterable(functionDefinition.parameterLists).collect(propagateUpdate(parametersToCeylon, update)));
            return parameterLists;
        }
        definition = blockToCeylon(functionDefinition.block, update);
        value typeParameters {
            if (exists jTypeParameterList = functionDefinition.typeParameterList) {
                return typeParametersToCeylon(jTypeParameterList, update);
            } else {
                return null;
            }
        }
        value typeConstraints {
            if (exists jTypeConstraintList = functionDefinition.typeConstraintList) {
                return CeylonIterable(jTypeConstraintList.typeConstraints).collect(propagateUpdate(typeConstraintToCeylon, update));
            } else {
                return [];
            }
        }
        value annotations {
            if (exists jAnnotationList = functionDefinition.annotationList) {
                return annotationsToCeylon(jAnnotationList, update);
            } else {
                return Annotations();
            }
        }
    };
    update(functionDefinition, result);
    return result;
}

"Parses the given [[code]] for a Function Definition
 into a [[FunctionDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared FunctionDefinition? parseFunctionDefinition(String code, Anything(JNode, Node) update = noop) {
    if (is JMethodDefinition jDeclaration = createParser(code).declaration()) {
        return functionDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
