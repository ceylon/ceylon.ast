import ceylon.ast.core {
    InOperation,
    Precedence10Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    inOperationToCeylon,
    compileInOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInOp=InOp
    }
}

shared object inOperation satisfies ConcreteTest<InOperation,JInOp> {
    
    String->InOperation construct(String->Precedence10Expression left, String->Precedence10Expression right)
            => "``left.key`` in ``right.key``"->InOperation(left.item, right.item);
    
    shared String->InOperation cInAIntersectBExpression = construct(baseExpression.cExpression, intersectionOperation.aIntersectBExpression);
    
    compile = compileInOperation;
    fromCeylon = RedHatTransformer.transformInOperation;
    toCeylon = inOperationToCeylon;
    codes = [cInAIntersectBExpression];
}
