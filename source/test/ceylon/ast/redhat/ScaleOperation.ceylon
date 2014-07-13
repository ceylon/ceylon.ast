import ceylon.ast.core {
    Precedence6Expression,
    Precedence7Expression,
    ScaleOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    scaleOperationToCeylon,
    compileScaleOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JScaleOp=ScaleOp
    }
}

shared object scaleOperation satisfies ConcreteTest<ScaleOperation,JScaleOp> {
    
    String->ScaleOperation construct(String->Precedence6Expression left, String->Precedence7Expression right)
            => "``left.key``**``right.key``"->ScaleOperation(left.item, right.item);
    
    shared String->ScaleOperation _1138ScaleAExpression = construct(integerLiteral._1138IntegerLiteral, baseExpression.aExpression);
    
    compile = compileScaleOperation;
    fromCeylon = RedHatTransformer.transformScaleOperation;
    toCeylon = scaleOperationToCeylon;
    codes = [_1138ScaleAExpression];
}
