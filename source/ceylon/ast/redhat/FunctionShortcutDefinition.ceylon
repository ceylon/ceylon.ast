import ceylon.ast.core {
    Annotations,
    FunctionShortcutDefinition,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared FunctionShortcutDefinition functionShortcutDefinitionToCeylon(JMethodDeclaration functionShortcutDefinition, Anything(JNode, Node) update = noop) {
    value result = FunctionShortcutDefinition {
        name = lIdentifierToCeylon(functionShortcutDefinition.identifier, update);
        value type {
            assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = functionShortcutDefinition.type);
            switch (jType)
            case (is JStaticType) { return typeToCeylon(jType, update); }
            case (is JVoidModifier) { return voidModifierToCeylon(jType, update); }
            case (is JFunctionModifier) { return functionModifierToCeylon(jType, update); }
            case (is JDynamicModifier) { return dynamicModifierToCeylon(jType, update); }
        }
        value parameterLists {
            assert (nonempty parameterLists = CeylonIterable(functionShortcutDefinition.parameterLists).collect(propagateUpdate(parametersToCeylon, update)));
            return parameterLists;
        }
        value definition {
            assert (is JLazySpecifierExpression jSpecifierExpression = functionShortcutDefinition.specifierExpression);
            return lazySpecifierToCeylon(jSpecifierExpression, update);
        }
        value typeParameters {
            if (exists jTypeParameterList = functionShortcutDefinition.typeParameterList) {
                return typeParametersToCeylon(jTypeParameterList, update);
            } else {
                return null;
            }
        }
        value typeConstraints {
            if (exists jTypeConstraintList = functionShortcutDefinition.typeConstraintList) {
                return CeylonIterable(jTypeConstraintList.typeConstraints).collect(propagateUpdate(typeConstraintToCeylon, update));
            } else {
                return [];
            }
        }
        value annotations {
            if (exists jAnnotationList = functionShortcutDefinition.annotationList) {
                return annotationsToCeylon(jAnnotationList, update);
            } else {
                return Annotations();
            }
        }
    };
    update(functionShortcutDefinition, result);
    return result;
}

"Parses the given [[code]] for a Function Shortcut Definition
 into a [[FunctionShortcutDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared FunctionShortcutDefinition? parseFunctionShortcutDefinition(String code, Anything(JNode, Node) update = noop) {
    if (is JMethodDeclaration jDeclaration = createParser(code).declaration(),
        jDeclaration.specifierExpression exists) {
        return functionShortcutDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
