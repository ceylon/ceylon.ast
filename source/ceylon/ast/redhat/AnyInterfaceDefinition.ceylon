import ceylon.ast.core {
    AnyInterfaceDefinition,
    CaseTypes,
    DynamicInterfaceDefinition,
    InterfaceDefinition,
    SatisfiedTypes,
    TypeConstraint,
    TypeParameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceDefinition=InterfaceDefinition
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[InterfaceDefinition|JInterfaceDefinition]] to a `ceylon.ast` [[AnyInterfaceDefinition]]."
shared AnyInterfaceDefinition anyInterfaceDefinitionToCeylon(JInterfaceDefinition anyInterfaceDefinition) {
    /*
     regular and dynamic interface definitions are so similar
     that it’s better to do the conversion for both here
     instead of delegating to sub-conversion functions
     */
    
    CaseTypes? caseTypes;
    if (exists jCaseTypes = anyInterfaceDefinition.caseTypes) {
        caseTypes = caseTypesToCeylon(jCaseTypes);
    } else {
        caseTypes = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = anyInterfaceDefinition.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes);
    } else {
        satisfiedTypes = null;
    }
    TypeParameters? typeParameters;
    if (exists jTypeParameterList = anyInterfaceDefinition.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameterList);
    } else {
        typeParameters = null;
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraintList = anyInterfaceDefinition.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraintList.typeConstraints).collect(typeConstraintToCeylon);
    } else {
        typeConstraints = [];
    }
    
    value args = [
        uIdentifierToCeylon(anyInterfaceDefinition.identifier),
        interfaceBodyToCeylon(anyInterfaceDefinition.interfaceBody),
        caseTypes,
        satisfiedTypes,
        typeParameters,
        typeConstraints,
        annotationsToCeylon(anyInterfaceDefinition.annotationList)
    ];
    
    if (anyInterfaceDefinition.\idynamic) {
        return DynamicInterfaceDefinition(*args);
    } else {
        return InterfaceDefinition(*args);
    }
}

"Compiles the given [[code]] for an Any Interface Definition
 into an [[AnyInterfaceDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AnyInterfaceDefinition? compileAnyInterfaceDefinition(String code) {
    if (is JInterfaceDefinition jDeclaration = createParser(code).declaration()) {
        return anyInterfaceDefinitionToCeylon(jDeclaration);
    } else {
        return null;
    }
}
