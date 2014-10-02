import ceylon.ast.core {
    Annotations,
    InterfaceAliasDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceDeclaration=InterfaceDeclaration
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[InterfaceDeclaration|JInterfaceDeclaration]] to a `ceylon.ast` [[InterfaceAliasDefinition]]."
shared InterfaceAliasDefinition interfaceAliasDefinitionToCeylon(JInterfaceDeclaration interfaceAliasDefinition) {
    return InterfaceAliasDefinition {
        name = uIdentifierToCeylon(interfaceAliasDefinition.identifier);
        specifier = typeSpecifierToCeylon(interfaceAliasDefinition.typeSpecifier);
        value caseTypes {
            if (exists jCaseTypes = interfaceAliasDefinition.caseTypes) {
                return caseTypesToCeylon(jCaseTypes);
            } else {
                return null;
            }
        }
        value satisfiedTypes {
            if (exists jSatisfiedTypes = interfaceAliasDefinition.satisfiedTypes) {
                return satisfiedTypesToCeylon(jSatisfiedTypes);
            } else {
                return null;
            }
        }
        value typeParameters {
            if (exists jTypeParameterList = interfaceAliasDefinition.typeParameterList) {
                return typeParametersToCeylon(jTypeParameterList);
            } else {
                return null;
            }
        }
        value typeConstraints {
            if (exists jTypeConstraintList = interfaceAliasDefinition.typeConstraintList) {
                return CeylonIterable(jTypeConstraintList.typeConstraints).collect(typeConstraintToCeylon);
            } else {
                return [];
            }
        }
        value annotations {
            if (exists jAnnotations = interfaceAliasDefinition.annotationList) {
                return annotationsToCeylon(jAnnotations);
            } else {
                return Annotations();
            }
        }
    };
}

"Compiles the given [[code]] for an Interface Alias Definition
 into an [[InterfaceAliasDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared InterfaceAliasDefinition? compileInterfaceAliasDefinition(String code) {
    if (is JInterfaceDeclaration jInterfaceAliasDefinition = createParser(code).declaration()) {
        return interfaceAliasDefinitionToCeylon(jInterfaceAliasDefinition);
    } else {
        return null;
    }
}
