import ceylon.ast.core {
    NotOperation,
    NegatingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    notOperationToCeylon,
    parseNotOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNotOp=NotOp
    }
}

shared object notOperation satisfies ConcreteTest<NotOperation,JNotOp> {
    
    String->NotOperation construct(String->NegatingExpression operand)
            => "!``operand.key``"->NotOperation(operand.item);
    
    shared String->NotOperation notTrueExpression = construct(baseExpression.trueExpression);
    shared String->NotOperation notAIsPersistentAndPrintableAndIdentifiableExpression = construct(isOperation.aIsPersistentAndPrintableAndIdentifiableExpression);
    shared String->NotOperation notCInAIntersectBExpression = construct(inOperation.cInAIntersectBExpression);
    
    // not tested directly, but used by other tests
    shared String->NotOperation notNameEmptyExpression = construct(qualifiedExpression.nameEmptyExpression);
    
    parse = parseNotOperation;
    fromCeylon = RedHatTransformer.transformNotOperation;
    toCeylon = notOperationToCeylon;
    codes = [notTrueExpression, notAIsPersistentAndPrintableAndIdentifiableExpression, notCInAIntersectBExpression];
}
