import ceylon.ast.core {
    IsCase,
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    isCaseToCeylon,
    parseIsCase
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIsCase=IsCase
    }
}

shared object isCase satisfies ConcreteTest<IsCase,JIsCase> {
    
    String->IsCase construct(String->Type type)
            => "is ``type.key``" -> IsCase(type.item);
    
    shared String->IsCase isStringCase = construct(baseType.stringType);
    shared String->IsCase isStringOrIntegerOrFloatCase = construct(unionType.stringOrIntegerOrFloatUnionType);
    
    // not tested directly, but used by other tests
    shared String->IsCase isIntegerCase = construct(baseType.integerType);
    
    parse = parseIsCase;
    fromCeylon = RedHatTransformer.transformIsCase;
    toCeylon = isCaseToCeylon;
    codes = [isStringCase, isStringOrIntegerOrFloatCase];
}
