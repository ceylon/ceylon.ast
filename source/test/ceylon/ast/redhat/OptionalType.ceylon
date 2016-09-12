import ceylon.ast.core {
    OptionalType,
    PrimaryType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    optionalTypeToCeylon,
    parseOptionalType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOptionalType=OptionalType
    }
}

shared object optionalType satisfies ConcreteTest<OptionalType,JOptionalType> {
    
    String->OptionalType construct(String->PrimaryType definite)
            => "``definite.key``?"->OptionalType(definite.item);
    
    shared String->OptionalType stringOptionalType = construct(baseType.stringType);
    shared String->OptionalType iterableOfStringOptionalType = construct(baseType.iterableOfStringType);
    
    parse = parseOptionalType;
    fromCeylon = RedHatTransformer.transformOptionalType;
    toCeylon = optionalTypeToCeylon;
    codes = [stringOptionalType, iterableOfStringOptionalType];
}
