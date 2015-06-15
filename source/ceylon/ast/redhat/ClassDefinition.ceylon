import ceylon.ast.core {
    Annotations,
    ClassDefinition,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JClassDefinition=ClassDefinition
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ClassDefinition|JClassDefinition]] to a `ceylon.ast` [[ClassDefinition]]."
shared ClassDefinition classDefinitionToCeylon(JClassDefinition classDefinition, Anything(JNode,Node) update = noop) {
    value result = ClassDefinition {
        name = uIdentifierToCeylon(classDefinition.identifier, update);
        value parameters {
            if (exists jParameterList = classDefinition.parameterList) {
                return parametersToCeylon(jParameterList, update);
            } else {
                return null;
            }
        }
        body = classBodyToCeylon(classDefinition.classBody, update);
        value caseTypes {
            if (exists jCaseTypes = classDefinition.caseTypes) {
                return caseTypesToCeylon(jCaseTypes, update);
            } else {
                return null;
            }
        }
        value extendedType {
            if (exists jExtendedType = classDefinition.extendedType) {
                return extendedTypeToCeylon(jExtendedType, update);
            } else {
                return null;
            }
        }
        value satisfiedTypes {
            if (exists jSatisfiedTypes = classDefinition.satisfiedTypes) {
                return satisfiedTypesToCeylon(jSatisfiedTypes, update);
            } else {
                return null;
            }
        }
        value typeParameters {
            if (exists jTypeParameters = classDefinition.typeParameterList) {
                return typeParametersToCeylon(jTypeParameters, update);
            } else {
                return null;
            }
        }
        value typeConstraints {
            if (exists jTypeConstraints = classDefinition.typeConstraintList) {
                return CeylonIterable(jTypeConstraints.typeConstraints).collect(propagateUpdate(typeConstraintToCeylon, update));
            } else {
                return [];
            }
        }
        value annotations {
            if (exists jAnnotations = classDefinition.annotationList) {
                return annotationsToCeylon(jAnnotations, update);
            } else {
                return Annotations();
            }
        }
    };
    update(classDefinition, result);
    return result;
}

"Compiles the given [[code]] for a Class Definition
 into a [[ClassDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ClassDefinition? compileClassDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JClassDefinition jDeclaration = createParser(code).declaration()) {
        return classDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
