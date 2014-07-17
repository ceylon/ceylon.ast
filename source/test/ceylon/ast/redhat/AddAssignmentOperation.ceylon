import ceylon.ast.core {
    AddAssignmentOperation,
    Precedence16Expression,
    Precedence17Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    addAssignmentOperationToCeylon,
    compileAddAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAddAssignOp=AddAssignOp
    }
}

shared object addAssignmentOperation satisfies ConcreteTest<AddAssignmentOperation,JAddAssignOp> {
    
    String->AddAssignmentOperation construct(String->Precedence16Expression left, String->Precedence17Expression right)
            => "``left.key``+=``right.key``"->AddAssignmentOperation(left.item, right.item);
    
    shared String->AddAssignmentOperation iAddAssignStepExpression = construct(baseExpression.iExpression, baseExpression.stepExpression);
    
    compile = compileAddAssignmentOperation;
    fromCeylon = RedHatTransformer.transformAddAssignmentOperation;
    toCeylon = addAssignmentOperationToCeylon;
    codes = [iAddAssignStepExpression];
}
