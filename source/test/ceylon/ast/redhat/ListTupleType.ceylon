import ceylon.ast.core {
    ListTupleType,
    TypeList
}
import ceylon.ast.redhat {
    RedHatTransformer,
    listTupleTypeToCeylon,
    compileListTupleType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTupleType=TupleType
    }
}

shared object listTupleType satisfies ConcreteTest<ListTupleType,JTupleType> {
    
    String->ListTupleType construct(String->TypeList list)
            => "[``list.key``]"->ListTupleType(list.item);
    
    shared String->ListTupleType emptyListTupleType = construct(typeList.emptyTypeList);
    shared String->ListTupleType stringPlusListTupleType = construct(typeList.stringPlusTypeList);
    shared String->ListTupleType integerFloatDefaultedStringStarListTupleType = construct(typeList.integerFloatDefaultedStringStarTypeList);
    
    // not tested directly, but used by other tests
    shared String->ListTupleType floatStarListTupleType = construct(typeList.floatStarTypeList);
    
    compile = compileListTupleType;
    fromCeylon = RedHatTransformer.transformListTupleType;
    toCeylon = listTupleTypeToCeylon;
    codes = [emptyListTupleType, stringPlusListTupleType, integerFloatDefaultedStringStarListTupleType];
}
