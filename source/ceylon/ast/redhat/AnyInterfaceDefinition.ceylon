import ceylon.ast.core {
    AnyInterfaceDefinition,
    CaseTypes,
    DynamicInterfaceDefinition,
    InterfaceDefinition,
    Node,
    SatisfiedTypes,
    TypeConstraint,
    TypeParameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JInterfaceDefinition=InterfaceDefinition
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[InterfaceDefinition|JInterfaceDefinition]] to a `ceylon.ast` [[AnyInterfaceDefinition]]."
shared AnyInterfaceDefinition anyInterfaceDefinitionToCeylon(JInterfaceDefinition anyInterfaceDefinition, Anything(JNode,Node) update = noop) {
    /*
     regular and dynamic interface definitions are so similar
     that it’s better to do the conversion for both here
     instead of delegating to sub-conversion functions
     */
    
    CaseTypes? caseTypes;
    if (exists jCaseTypes = anyInterfaceDefinition.caseTypes) {
        caseTypes = caseTypesToCeylon(jCaseTypes, update);
    } else {
        caseTypes = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = anyInterfaceDefinition.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes, update);
    } else {
        satisfiedTypes = null;
    }
    TypeParameters? typeParameters;
    if (exists jTypeParameterList = anyInterfaceDefinition.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameterList, update);
    } else {
        typeParameters = null;
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraintList = anyInterfaceDefinition.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraintList.typeConstraints).collect(propagateUpdate(typeConstraintToCeylon, update));
    } else {
        typeConstraints = [];
    }
    
    value args = [
        uIdentifierToCeylon(anyInterfaceDefinition.identifier, update),
        interfaceBodyToCeylon(anyInterfaceDefinition.interfaceBody, update),
        caseTypes,
        satisfiedTypes,
        typeParameters,
        typeConstraints,
        annotationsToCeylon(anyInterfaceDefinition.annotationList, update)
    ];
    
    AnyInterfaceDefinition result;
    if (anyInterfaceDefinition.\idynamic) {
        result = DynamicInterfaceDefinition(*args);
    } else {
        result = InterfaceDefinition(*args);
    }
    update(anyInterfaceDefinition, result);
    return result;
}

"Parses the given [[code]] for an Any Interface Definition
 into an [[AnyInterfaceDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AnyInterfaceDefinition? parseAnyInterfaceDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JInterfaceDefinition jDeclaration = createParser(code).declaration()) {
        return anyInterfaceDefinitionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
