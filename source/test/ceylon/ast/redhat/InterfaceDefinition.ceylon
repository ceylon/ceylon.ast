import ceylon.ast.core {
    Annotations,
    CaseTypes,
    InterfaceBody,
    InterfaceDefinition,
    SatisfiedTypes,
    TypeConstraint,
    TypeParameters,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    interfaceDefinitionToCeylon,
    parseInterfaceDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceDefinition=InterfaceDefinition
    }
}

shared object interfaceDefinition satisfies ConcreteTest<InterfaceDefinition,JInterfaceDefinition> {
    
    String->InterfaceDefinition construct(String->UIdentifier name, String->InterfaceBody body, <String->CaseTypes>? caseTypes = null, <String->SatisfiedTypes>? satisfiedTypes = null, <String->TypeParameters>? typeParameters = null, <String->TypeConstraint>[] typeConstraints = [], String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` interface ``name.key`` `` typeParameters?.key else "" `` `` caseTypes?.key else "" `` `` satisfiedTypes?.key else "" `` ``" ".join(typeConstraints*.key)`` ``body.key``"->InterfaceDefinition(name.item, body.item, caseTypes?.item, satisfiedTypes?.item, typeParameters?.item, typeConstraints*.item, annotations.item);
    
    shared String->InterfaceDefinition mutableListInterfaceDefinition = construct(identifier.mutableListUIdentifier, interfaceBody.emptyInterfaceBody);
    shared String->InterfaceDefinition nonemptyInterfaceDefinition = construct(identifier.uidUIdentifier, interfaceBody.emptyInterfaceBody, caseTypes.ofStringIntegerFloatCaseTypes, satisfiedTypes.satisfiesStringStarAndPrintableSatisfiedTypes, typeParameters.twoTypeParameters, [typeConstraint.emptyTypeConstraint, typeConstraint.nonemptyTypeConstraint], annotations.sharedAnnotations);
    
    parse = parseInterfaceDefinition;
    fromCeylon = RedHatTransformer.transformInterfaceDefinition;
    toCeylon = interfaceDefinitionToCeylon;
    codes = [mutableListInterfaceDefinition, nonemptyInterfaceDefinition];
}
