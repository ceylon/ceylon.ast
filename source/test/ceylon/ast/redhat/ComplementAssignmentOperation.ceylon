import ceylon.ast.core {
    ComplementAssignmentOperation,
    Precedence16Expression,
    Precedence17Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    complementAssignmentOperationToCeylon,
    compileComplementAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComplementAssignOp=ComplementAssignOp
    }
}

shared object complementAssignmentOperation satisfies ConcreteTest<ComplementAssignmentOperation,JComplementAssignOp> {
    
    String->ComplementAssignmentOperation construct(String->Precedence16Expression left, String->Precedence17Expression right)
            => "``left.key``~=``right.key``"->ComplementAssignmentOperation(left.item, right.item);
    
    shared String->ComplementAssignmentOperation aComplementAssignBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileComplementAssignmentOperation;
    fromCeylon = RedHatTransformer.transformComplementAssignmentOperation;
    toCeylon = complementAssignmentOperationToCeylon;
    codes = [aComplementAssignBExpression];
}
