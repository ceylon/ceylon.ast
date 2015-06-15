import ceylon.ast.core {
    Annotations,
    ClassAliasDefinition,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JClassDeclaration=ClassDeclaration
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ClassDeclaration|JClassDeclaration]] to a `ceylon.ast` [[ClassAliasDefinition]]."
shared ClassAliasDefinition classAliasDefinitionToCeylon(JClassDeclaration classAliasDefinition, Anything(JNode,Node) update = noop) {
    value result = ClassAliasDefinition {
        name = uIdentifierToCeylon(classAliasDefinition.identifier, update);
        parameters = parametersToCeylon(classAliasDefinition.parameterList, update);
        specifier = classSpecifierToCeylon(classAliasDefinition.classSpecifier, update);
        value caseTypes {
            if (exists jCaseTypes = classAliasDefinition.caseTypes) {
                return caseTypesToCeylon(jCaseTypes, update);
            } else {
                return null;
            }
        }
        value extendedType {
            if (exists jExtendedType = classAliasDefinition.extendedType) {
                return extendedTypeToCeylon(jExtendedType, update);
            } else {
                return null;
            }
        }
        value satisfiedTypes {
            if (exists jSatisfiedTypes = classAliasDefinition.satisfiedTypes) {
                return satisfiedTypesToCeylon(jSatisfiedTypes, update);
            } else {
                return null;
            }
        }
        value typeParameters {
            if (exists jTypeParameters = classAliasDefinition.typeParameterList) {
                return typeParametersToCeylon(jTypeParameters, update);
            } else {
                return null;
            }
        }
        value typeConstraints {
            if (exists jTypeConstraints = classAliasDefinition.typeConstraintList) {
                return CeylonIterable(jTypeConstraints.typeConstraints).collect(propagateUpdate(typeConstraintToCeylon, update));
            } else {
                return [];
            }
        }
        value annotations {
            if (exists jAnnotations = classAliasDefinition.annotationList) {
                return annotationsToCeylon(jAnnotations, update);
            } else {
                return Annotations();
            }
        }
    };
    update(classAliasDefinition, result);
    return result;
}

"Compiles the given [[code]] for a Class Alias
 into a [[ClassAliasDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ClassAliasDefinition? compileClassAliasDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JClassDeclaration jDeclaration = createParser(code).declaration()) {
        return classAliasDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
