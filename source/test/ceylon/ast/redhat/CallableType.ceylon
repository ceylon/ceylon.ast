import ceylon.ast.core {
    CallableType,
    PrimaryType,
    SpreadType,
    TypeList
}
import ceylon.ast.redhat {
    RedHatTransformer,
    callableTypeToCeylon,
    compileCallableType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionType=FunctionType
    }
}

shared object callableType satisfies ConcreteTest<CallableType,JFunctionType> {
    
    String->CallableType construct(String->PrimaryType ret, String->TypeList|SpreadType args)
            => "``ret.key``(``args.key``)"->CallableType(ret.item, args.item);
    
    shared String->CallableType anythingFromEmptyCallableType = construct(baseType.anythingType, typeList.emptyTypeList);
    shared String->CallableType floatStarTupleFromStringPlusCallableType = construct(tupleType.floatStarTupleType, typeList.stringPlusTypeList);
    shared String->CallableType nothingFromIntegerFloatDefaultedStringStarCallableType = construct(baseType.nothingType, typeList.integerFloatDefaultedStringStarTypeList);
    shared String->CallableType retFromArgsCallableType = construct(baseType.retType, spreadType.argsSpreadType);
    
    compile = compileCallableType;
    fromCeylon = RedHatTransformer.transformCallableType;
    toCeylon = callableTypeToCeylon;
    codes = [anythingFromEmptyCallableType, floatStarTupleFromStringPlusCallableType, nothingFromIntegerFloatDefaultedStringStarCallableType];
}
