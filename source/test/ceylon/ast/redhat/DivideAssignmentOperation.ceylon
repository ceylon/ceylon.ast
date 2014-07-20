import ceylon.ast.core {
    DivideAssignmentOperation,
    Precedence16Expression,
    Precedence18Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    divideAssignmentOperationToCeylon,
    compileDivideAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDivideAssignOp=DivideAssignOp
    }
}

shared object divideAssignmentOperation satisfies ConcreteTest<DivideAssignmentOperation,JDivideAssignOp> {
    
    String->DivideAssignmentOperation construct(String->Precedence16Expression left, String->Precedence18Expression right)
            => "``left.key``/=``right.key``"->DivideAssignmentOperation(left.item, right.item);
    
    shared String->DivideAssignmentOperation stepDivideAssign2Expression = construct(baseExpression.stepExpression, integerLiteral._2IntegerLiteral);
    
    compile = compileDivideAssignmentOperation;
    fromCeylon = RedHatTransformer.transformDivideAssignmentOperation;
    toCeylon = divideAssignmentOperationToCeylon;
    codes = [stepDivideAssign2Expression];
}
