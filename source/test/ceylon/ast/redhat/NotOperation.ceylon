import ceylon.ast.core {
    NotOperation,
    Precedence13Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    notOperationToCeylon,
    compileNotOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNotOp=NotOp
    }
}

shared object notOperation satisfies ConcreteTest<NotOperation,JNotOp> {
    
    String->NotOperation construct(String->Precedence13Expression operand)
            => "!``operand.key``"->NotOperation(operand.item);
    
    shared String->NotOperation notTrueExpression = construct(baseExpression.trueExpression);
    shared String->NotOperation notAIsPersistentAndPrintableAndIdentifiableExpression = construct(isOperation.aIsPersistentAndPrintableAndIdentifiableExpression);
    shared String->NotOperation notCInAIntersectBExpression = construct(inOperation.cInAIntersectBExpression);
    
    compile = compileNotOperation;
    fromCeylon = RedHatTransformer.transformNotOperation;
    toCeylon = notOperationToCeylon;
    codes = [notTrueExpression, notAIsPersistentAndPrintableAndIdentifiableExpression, notCInAIntersectBExpression];
}
