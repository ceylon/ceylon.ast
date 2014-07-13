import ceylon.ast.core {
    Precedence4Expression,
    Precedence5Expression,
    UnionOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unionOperationToCeylon,
    compileUnionOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnionOp=UnionOp
    }
}

shared object unionOperation satisfies ConcreteTest<UnionOperation,JUnionOp> {
    
    String->UnionOperation construct(String->Precedence5Expression left, String->Precedence4Expression right)
            => "``left.key``|``right.key``"->UnionOperation(left.item, right.item);
    
    shared String->UnionOperation aUnionBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileUnionOperation;
    fromCeylon = RedHatTransformer.transformUnionOperation;
    toCeylon = unionOperationToCeylon;
    codes = [aUnionBExpression];
}
