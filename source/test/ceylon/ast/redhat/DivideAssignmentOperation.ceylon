import ceylon.ast.core {
    DivideAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    divideAssignmentOperationToCeylon,
    parseDivideAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDivideAssignOp=DivideAssignOp
    }
}

shared object divideAssignmentOperation satisfies ConcreteTest<DivideAssignmentOperation,JDivideAssignOp> {
    
    String->DivideAssignmentOperation construct(String->ThenElseExpression left, String->AssigningExpression right)
            => "``left.key``/=``right.key``"->DivideAssignmentOperation(left.item, right.item);
    
    shared String->DivideAssignmentOperation stepDivideAssign2Expression = construct(baseExpression.stepExpression, integerLiteral._2IntegerLiteral);
    
    parse = parseDivideAssignmentOperation;
    fromCeylon = RedHatTransformer.transformDivideAssignmentOperation;
    toCeylon = divideAssignmentOperationToCeylon;
    codes = [stepDivideAssign2Expression];
}
