import ceylon.ast.core {
    Precedence16Expression,
    Precedence17Expression,
    UnionAssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unionAssignmentOperationToCeylon,
    compileUnionAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnionAssignOp=UnionAssignOp
    }
}

shared object unionAssignmentOperation satisfies ConcreteTest<UnionAssignmentOperation,JUnionAssignOp> {
    
    String->UnionAssignmentOperation construct(String->Precedence16Expression left, String->Precedence17Expression right)
            => "``left.key``|=``right.key``"->UnionAssignmentOperation(left.item, right.item);
    
    shared String->UnionAssignmentOperation aUnionAssignBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileUnionAssignmentOperation;
    fromCeylon = RedHatTransformer.transformUnionAssignmentOperation;
    toCeylon = unionAssignmentOperationToCeylon;
    codes = [aUnionAssignBExpression];
}
