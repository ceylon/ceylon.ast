import ceylon.ast.core {
    Annotations,
    ClassBody,
    ExtendedType,
    LIdentifier,
    ObjectDefinition,
    SatisfiedTypes
}
import ceylon.ast.redhat {
    RedHatTransformer,
    objectDefinitionToCeylon,
    compileObjectDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JObjectDefinition=ObjectDefinition
    }
}

shared object objectDefinition satisfies ConcreteTest<ObjectDefinition,JObjectDefinition> {
    
    String->ObjectDefinition construct(String->LIdentifier name, String->ClassBody body, <String->ExtendedType>? extendedType = null, <String->SatisfiedTypes>? satisfiedTypes = null, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` object ``name.key`` `` extendedType?.key else "" `` `` satisfiedTypes?.key else "" `` ``body.key``"->ObjectDefinition(name.item, body.item, extendedType?.item, satisfiedTypes?.item, annotations.item);
    
    shared String->ObjectDefinition nullObjectDefinition = construct(identifier.nullLIdentifier, classBody.emptyClassBody, extendedType.extendsNull);
    
    compile = compileObjectDefinition;
    fromCeylon = RedHatTransformer.transformObjectDefinition;
    toCeylon = objectDefinitionToCeylon;
    codes = [nullObjectDefinition];
}
