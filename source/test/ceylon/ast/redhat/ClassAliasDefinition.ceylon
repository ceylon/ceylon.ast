import ceylon.ast.core {
    Annotations,
    CaseTypes,
    ClassAliasDefinition,
    ClassSpecifier,
    ExtendedType,
    Parameters,
    SatisfiedTypes,
    TypeConstraint,
    TypeParameters,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    classAliasDefinitionToCeylon,
    compileClassAliasDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassDeclaration=ClassDeclaration
    }
}

shared object classAliasDefinition satisfies ConcreteTest<ClassAliasDefinition,JClassDeclaration> {
    
    String->ClassAliasDefinition construct(String->UIdentifier name, String->Parameters parameters, String->ClassSpecifier specifier, <String->CaseTypes>? caseTypes = null, <String->ExtendedType>? extendedType = null, <String->SatisfiedTypes>? satisfiedTypes = null, <String->TypeParameters>? typeParameters = null, <String->TypeConstraint>[] typeConstraints = [], String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` class ``name.key`` `` typeParameters?.key else "" `` ``parameters.key`` `` caseTypes?.key else "" `` `` extendedType?.key else "" `` `` satisfiedTypes?.key else "" `` ``" ".join(typeConstraints*.key)`` ``specifier.key``;"->ClassAliasDefinition(name.item, parameters.item, specifier.item, caseTypes?.item, extendedType?.item, satisfiedTypes?.item, typeParameters?.item, typeConstraints*.item, annotations.item);
    
    shared String->ClassAliasDefinition variadicStringClassAliasDefinition = construct(identifier.variadicStringUIdentifier, parameters.charactersParameters, classSpecifier.classSpecifyStringCharacters);
    
    compile = compileClassAliasDefinition;
    fromCeylon = RedHatTransformer.transformClassAliasDefinition;
    toCeylon = classAliasDefinitionToCeylon;
    codes = [variadicStringClassAliasDefinition];
}
