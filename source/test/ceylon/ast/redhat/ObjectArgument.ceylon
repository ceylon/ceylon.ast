import ceylon.ast.core {
    ClassBody,
    ExtendedType,
    LIdentifier,
    ObjectArgument,
    SatisfiedTypes
}
import ceylon.ast.redhat {
    RedHatTransformer,
    objectArgumentToCeylon,
    parseObjectArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JObjectArgument=ObjectArgument
    }
}

shared object objectArgument satisfies ConcreteTest<ObjectArgument,JObjectArgument> {
    
    String->ObjectArgument construct(String->LIdentifier name, String->ClassBody body, <String->ExtendedType>? extendedType = null, <String->SatisfiedTypes>? satisfiedTypes = null)
            => "object ``name.key`` `` extendedType?.key else "" `` `` satisfiedTypes?.key else "" `` ``body.key``"->ObjectArgument(name.item, body.item, extendedType?.item, satisfiedTypes?.item);
    
    shared String->ObjectArgument nullObjectArgument = construct(identifier.nullLIdentifier, classBody.emptyClassBody, extendedType.extendsNull, satisfiedTypes.satisfiesStringStarAndPrintableSatisfiedTypes /* because I’m to lazy to write a separate test for that */);
    
    parse = parseObjectArgument;
    fromCeylon = RedHatTransformer.transformObjectArgument;
    toCeylon = objectArgumentToCeylon;
    codes = [nullObjectArgument];
}
