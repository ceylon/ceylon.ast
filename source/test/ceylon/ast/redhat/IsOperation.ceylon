import ceylon.ast.core {
    IsOperation,
    ExistsNonemptyExpression,
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    isOperationToCeylon,
    parseIsOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIsOp=IsOp
    }
}

shared object isOperation satisfies ConcreteTest<IsOperation,JIsOp> {
    
    String->IsOperation construct(String->ExistsNonemptyExpression operand, String->Type type)
            => "``operand.key`` is ``type.key``"->IsOperation(operand.item, type.item);
    
    shared String->IsOperation aIsPersistentAndPrintableAndIdentifiableExpression = construct(baseExpression.aExpression, intersectionType.persistentAndPrintableAndIdentifiableIntersectionType);
    
    parse = parseIsOperation;
    fromCeylon = RedHatTransformer.transformIsOperation;
    toCeylon = isOperationToCeylon;
    codes = [aIsPersistentAndPrintableAndIdentifiableExpression];
}
