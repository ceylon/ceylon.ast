import ceylon.ast.core {
    IntegerLiteral,
    LengthTupleType,
    PrimaryType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    lengthTupleTypeToCeylon,
    compileLengthTupleType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequenceType=SequenceType
    }
}

shared object lengthTupleType satisfies ConcreteTest<LengthTupleType,JSequenceType> {
    
    String->LengthTupleType construct(String->PrimaryType elementType, String->IntegerLiteral length)
            => "``elementType.key``[``length.key``]"->LengthTupleType(elementType.item, length.item);
    
    shared String->LengthTupleType eightBooleansLengthTupleType = construct(baseType.booleanType, integerLiteral._8IntegerLiteral);
    shared String->LengthTupleType twoEightBooleansLengthTupleType = construct(eightBooleansLengthTupleType, integerLiteral._2IntegerLiteral);
    shared String->LengthTupleType callableLengthTupleType = construct(callableType.anythingFromEmptyCallableType, integerLiteral._2IntegerLiteral);
    
    compile = compileLengthTupleType;
    fromCeylon = RedHatTransformer.transformLengthTupleType;
    toCeylon = lengthTupleTypeToCeylon;
    codes = [eightBooleansLengthTupleType, twoEightBooleansLengthTupleType, callableLengthTupleType];
}
