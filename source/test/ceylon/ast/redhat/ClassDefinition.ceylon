import ceylon.ast.core {
    Annotations,
    CaseTypes,
    ClassBody,
    ClassDefinition,
    ExtendedType,
    Parameters,
    SatisfiedTypes,
    TypeConstraint,
    TypeParameters,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    classDefinitionToCeylon,
    parseClassDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassDefinition=ClassDefinition
    }
}

shared object classDefinition satisfies ConcreteTest<ClassDefinition,JClassDefinition> {
    
    String->ClassDefinition construct(String->UIdentifier name, <String->Parameters>? parameters, String->ClassBody body, <String->CaseTypes>? caseTypes = null, <String->ExtendedType>? extendedType = null, <String->SatisfiedTypes>? satisfiedTypes = null, <String->TypeParameters>? typeParameters = null, <String->TypeConstraint>[] typeConstraints = [], String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` class ``name.key`` `` typeParameters?.key else "" `` `` parameters?.key else "" `` `` caseTypes?.key else "" `` `` extendedType?.key else "" `` `` satisfiedTypes?.key else "" `` ``" ".join(typeConstraints*.key)`` ``body.key``" -> ClassDefinition(name.item, parameters?.item, body.item, caseTypes?.item, extendedType?.item, satisfiedTypes?.item, typeParameters?.item, typeConstraints*.item, annotations.item);
    
    shared String->ClassDefinition nullClassDefinition = construct {
        name = identifier.nullUIdentifier;
        parameters = parameters.emptyParameters;
        body = classBody.emptyClassBody;
        caseTypes = caseTypes.ofNullCaseTypes;
        extendedType = extendedType.extendsAnything;
    };
    
    shared String->ClassDefinition pointClassDefinition = construct {
        name = identifier.pointUIdentifier;
        parameters = null; // two explicit constructors, one value constructor
        body = classBody.pointClassBody;
        annotations = annotations.sharedAnnotations;
    };
    
    parse = parseClassDefinition;
    fromCeylon = RedHatTransformer.transformClassDefinition;
    toCeylon = classDefinitionToCeylon;
    codes = [nullClassDefinition, pointClassDefinition];
}
