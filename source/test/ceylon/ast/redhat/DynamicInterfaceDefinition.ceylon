import ceylon.ast.core {
    Annotations,
    CaseTypes,
    DynamicInterfaceDefinition,
    InterfaceBody,
    SatisfiedTypes,
    TypeConstraint,
    TypeParameters,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    dynamicInterfaceDefinitionToCeylon,
    compileDynamicInterfaceDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceDefinition=InterfaceDefinition
    }
}

shared object dynamicInterfaceDefinition satisfies ConcreteTest<DynamicInterfaceDefinition,JInterfaceDefinition> {
    
    String->DynamicInterfaceDefinition construct(String->UIdentifier name, String->InterfaceBody body, <String->CaseTypes>? caseTypes = null, <String->SatisfiedTypes>? satisfiedTypes = null, <String->TypeParameters>? typeParameters = null, <String->TypeConstraint>[] typeConstraints = [], String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` dynamic ``name.key`` `` typeParameters?.key else "" `` `` caseTypes?.key else "" `` `` satisfiedTypes?.key else "" `` ``" ".join(typeConstraints*.key)`` ``body.key``"->DynamicInterfaceDefinition(name.item, body.item, caseTypes?.item, satisfiedTypes?.item, typeParameters?.item, typeConstraints*.item, annotations.item);
    
    shared String->DynamicInterfaceDefinition nonemptyDynamicInterfaceDefinition = construct(identifier.systemUIdentifier, interfaceBody.emptyInterfaceBody, caseTypes.ofStringIntegerFloatCaseTypes, satisfiedTypes.satisfiesStringStarAndPrintableSatisfiedTypes, typeParameters.twoTypeParameters, [typeConstraint.emptyTypeConstraint, typeConstraint.nonemptyTypeConstraint], annotations.helloSharedByLucasAnnotations);
    
    compile = compileDynamicInterfaceDefinition;
    fromCeylon = RedHatTransformer.transformDynamicInterfaceDefinition;
    toCeylon = dynamicInterfaceDefinitionToCeylon;
    codes = [nonemptyDynamicInterfaceDefinition];
}
