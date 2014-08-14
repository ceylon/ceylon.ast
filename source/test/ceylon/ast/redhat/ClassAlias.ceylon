import ceylon.ast.core {
    Annotations,
    CaseTypes,
    ClassAlias,
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
    classAliasToCeylon,
    compileClassAlias
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassDeclaration=ClassDeclaration
    }
}

shared object classAlias satisfies ConcreteTest<ClassAlias,JClassDeclaration> {
    
    String->ClassAlias construct(String->UIdentifier name, String->Parameters parameters, String->ClassSpecifier specifier, <String->CaseTypes>? caseTypes = null, <String->ExtendedType>? extendedType = null, <String->SatisfiedTypes>? satisfiedTypes = null, <String->TypeParameters>? typeParameters = null, <String->TypeConstraint>[] typeConstraints = [], String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` class ``name.key`` `` typeParameters?.key else "" `` ``parameters.key`` `` caseTypes?.key else "" `` `` extendedType?.key else "" `` `` satisfiedTypes?.key else "" `` ``" ".join(typeConstraints*.key)`` ``specifier.key``;"->ClassAlias(name.item, parameters.item, specifier.item, caseTypes?.item, extendedType?.item, satisfiedTypes?.item, typeParameters?.item, typeConstraints*.item, annotations.item);
    
    shared String->ClassAlias variadicStringClassAlias = construct(identifier.variadicStringUIdentifier, parameters.charactersParameters, classSpecifier.classSpecifyStringCharacters);
    
    compile = compileClassAlias;
    fromCeylon = RedHatTransformer.transformClassAlias;
    toCeylon = classAliasToCeylon;
    codes = [variadicStringClassAlias];
}
