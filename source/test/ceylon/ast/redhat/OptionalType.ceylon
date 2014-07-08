import ceylon.ast.core {
    OptionalType,
    PrimaryType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    optionalTypeToCeylon,
    compileOptionalType
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
    
    shared actual OptionalType? compile(String code) => compileOptionalType(code);
    shared actual JOptionalType fromCeylon(RedHatTransformer transformer)(OptionalType node) => transformer.transformOptionalType(node);
    shared actual OptionalType toCeylon(JOptionalType node) => optionalTypeToCeylon(node);
    codes = [stringOptionalType, iterableOfStringOptionalType];
}
