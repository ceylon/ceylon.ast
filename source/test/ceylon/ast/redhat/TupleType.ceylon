import ceylon.ast.core {
    TupleType,
    TypeList
}
import ceylon.ast.redhat {
    RedHatTransformer,
    tupleTypeToCeylon,
    parseTupleType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTupleType=TupleType
    }
}

shared object tupleType satisfies ConcreteTest<TupleType,JTupleType> {
    
    String->TupleType construct(String->TypeList list)
            => "[``list.key``]" -> TupleType(list.item);
    
    shared String->TupleType emptyTupleType = construct(typeList.emptyTypeList);
    shared String->TupleType stringPlusTupleType = construct(typeList.stringPlusTypeList);
    shared String->TupleType integerFloatDefaultedStringStarTupleType = construct(typeList.integerFloatDefaultedStringStarTypeList);
    
    // not tested directly, but used by other tests
    shared String->TupleType floatStarTupleType = construct(typeList.floatStarTypeList);
    
    parse = parseTupleType;
    fromCeylon = RedHatTransformer.transformTupleType;
    toCeylon = tupleTypeToCeylon;
    codes = [emptyTupleType, stringPlusTupleType, integerFloatDefaultedStringStarTupleType];
}
