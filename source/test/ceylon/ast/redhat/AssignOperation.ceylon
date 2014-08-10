import ceylon.ast.core {
    AssignOperation,
    Precedence16Expression,
    Precedence17Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    assignOperationToCeylon,
    compileAssignOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAssignOp=AssignOp
    }
}

shared object assignOperation satisfies ConcreteTest<AssignOperation,JAssignOp> {
    
    String->AssignOperation construct(String->Precedence16Expression left, String->Precedence17Expression right)
            => "``left.key``=``right.key``"->AssignOperation(left.item, right.item);
    
    shared String->AssignOperation iAssign1Expression = construct(baseExpression.iExpression, integerLiteral.oneIntegerLiteral);
    shared String->AssignOperation textAssignExpression = construct(baseExpression.textExpression, sumOperation.helloPlusNameElseWorldPlusBangExpression);
    
    // not tested directly, but used by other tests
    shared String->AssignOperation nameEmptyAssignTrueExpression = construct(qualifiedExpression.nameEmptyExpression, baseExpression.trueExpression);
    
    compile = compileAssignOperation;
    fromCeylon = RedHatTransformer.transformAssignOperation;
    toCeylon = assignOperationToCeylon;
    codes = [iAssign1Expression, textAssignExpression];
}
