import ceylon.ast.core {
    Annotations,
    CaseTypes,
    InterfaceAliasDefinition,
    SatisfiedTypes,
    TypeConstraint,
    TypeParameters,
    TypeSpecifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    interfaceAliasDefinitionToCeylon,
    parseInterfaceAliasDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceDeclaration=InterfaceDeclaration
    }
}

shared object interfaceAliasDefinition satisfies ConcreteTest<InterfaceAliasDefinition,JInterfaceDeclaration> {
    
    String->InterfaceAliasDefinition construct(String->UIdentifier name, String->TypeSpecifier specifier, <String->CaseTypes>? caseTypes = null, <String->SatisfiedTypes>? satisfiedTypes = null, <String->TypeParameters>? typeParameters = null, <String->TypeConstraint>[] typeConstraints = [], String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` interface ``name.key`` `` typeParameters?.key else "" `` `` caseTypes?.key else "" `` `` satisfiedTypes?.key else "" `` ``" ".join(typeConstraints*.key)`` ``specifier.key``;"->InterfaceAliasDefinition(name.item, specifier.item, caseTypes?.item, satisfiedTypes?.item, typeParameters?.item, typeConstraints*.item, annotations.item);
    
    shared String->InterfaceAliasDefinition peopleByNameInterfaceAliasDefinition = construct(identifier.peopleByNameUIdentifier, typeSpecifier.mapOfStringPeopleTypeSpecifier);
    
    parse = parseInterfaceAliasDefinition;
    fromCeylon = RedHatTransformer.transformInterfaceAliasDefinition;
    toCeylon = interfaceAliasDefinitionToCeylon;
    codes = [peopleByNameInterfaceAliasDefinition];
}
