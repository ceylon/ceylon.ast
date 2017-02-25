import ceylon.ast.core {
    Annotations,
    InterfaceAliasDefinition,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JInterfaceDeclaration=InterfaceDeclaration
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[InterfaceDeclaration|JInterfaceDeclaration]] to a `ceylon.ast` [[InterfaceAliasDefinition]]."
shared InterfaceAliasDefinition interfaceAliasDefinitionToCeylon(JInterfaceDeclaration interfaceAliasDefinition, Anything(JNode, Node) update = noop) {
    value result = InterfaceAliasDefinition {
        name = uIdentifierToCeylon(interfaceAliasDefinition.identifier, update);
        specifier = typeSpecifierToCeylon(interfaceAliasDefinition.typeSpecifier, update);
        value caseTypes {
            if (exists jCaseTypes = interfaceAliasDefinition.caseTypes) {
                return caseTypesToCeylon(jCaseTypes, update);
            } else {
                return null;
            }
        }
        value satisfiedTypes {
            if (exists jSatisfiedTypes = interfaceAliasDefinition.satisfiedTypes) {
                return satisfiedTypesToCeylon(jSatisfiedTypes, update);
            } else {
                return null;
            }
        }
        value typeParameters {
            if (exists jTypeParameterList = interfaceAliasDefinition.typeParameterList) {
                return typeParametersToCeylon(jTypeParameterList, update);
            } else {
                return null;
            }
        }
        value typeConstraints {
            if (exists jTypeConstraintList = interfaceAliasDefinition.typeConstraintList) {
                return CeylonIterable(jTypeConstraintList.typeConstraints).collect(propagateUpdate(typeConstraintToCeylon, update));
            } else {
                return [];
            }
        }
        value annotations {
            if (exists jAnnotations = interfaceAliasDefinition.annotationList) {
                return annotationsToCeylon(jAnnotations, update);
            } else {
                return Annotations();
            }
        }
    };
    update(interfaceAliasDefinition, result);
    return result;
}

"Parses the given [[code]] for an Interface Alias Definition
 into an [[InterfaceAliasDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared InterfaceAliasDefinition? parseInterfaceAliasDefinition(String code, Anything(JNode, Node) update = noop) {
    if (is JInterfaceDeclaration jInterfaceAliasDefinition = createParser(code).declaration()) {
        return interfaceAliasDefinitionToCeylon(jInterfaceAliasDefinition, update);
    } else {
        return null;
    }
}
