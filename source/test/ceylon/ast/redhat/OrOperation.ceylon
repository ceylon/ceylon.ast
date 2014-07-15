import ceylon.ast.core {
    OrOperation,
    Precedence14Expression,
    Precedence15Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    orOperationToCeylon,
    compileOrOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOrOp=OrOp
    }
}

shared object orOperation satisfies ConcreteTest<OrOperation,JOrOp> {
    
    String->OrOperation construct(String->Precedence15Expression left, String->Precedence14Expression right)
            => "``left.key``||``right.key``"->OrOperation(left.item, right.item);
    
    shared String->OrOperation aOrBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileOrOperation;
    fromCeylon = RedHatTransformer.transformOrOperation;
    toCeylon = orOperationToCeylon;
    codes = [aOrBExpression];
}
