import ceylon.ast.core {
    CallableType,
    PrimaryType,
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
    
    String->CallableType construct(String->PrimaryType ret, String->TypeList args)
            => "``ret.key``(``args.key``)"->CallableType(ret.item, args.item);
    
    shared String->CallableType anythingFromEmptyCallableType = construct(baseType.anythingType, typeList.emptyTypeList);
    shared String->CallableType floatStarTupleFromStringPlusCallableType = construct(tupleType.floatStarTupleType, typeList.stringPlusTypeList);
    shared String->CallableType nothingFromIntegerFloatDefaultedStringStarCallableType = construct(baseType.nothingType, typeList.integerFloatDefaultedStringStarTypeList);
    
    shared actual CallableType? compile(String code) => compileCallableType(code);
    shared actual JFunctionType fromCeylon(RedHatTransformer transformer)(CallableType node) => transformer.transformCallableType(node);
    shared actual CallableType toCeylon(JFunctionType node) => callableTypeToCeylon(node);
    codes = [anythingFromEmptyCallableType, floatStarTupleFromStringPlusCallableType, nothingFromIntegerFloatDefaultedStringStarCallableType];
}
