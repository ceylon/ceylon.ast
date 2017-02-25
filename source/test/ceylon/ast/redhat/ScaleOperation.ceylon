import ceylon.ast.core {
    MultiplyingExpression,
    ScalingExpression,
    ScaleOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    scaleOperationToCeylon,
    parseScaleOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JScaleOp=ScaleOp
    }
}

shared object scaleOperation satisfies ConcreteTest<ScaleOperation,JScaleOp> {
    
    String->ScaleOperation construct(String->MultiplyingExpression left, String->ScalingExpression right)
            => "``left.key``**``right.key``" -> ScaleOperation(left.item, right.item);
    
    shared String->ScaleOperation _1138ScaleAExpression = construct(integerLiteral._1138IntegerLiteral, baseExpression.aExpression);
    
    parse = parseScaleOperation;
    fromCeylon = RedHatTransformer.transformScaleOperation;
    toCeylon = scaleOperationToCeylon;
    codes = [_1138ScaleAExpression];
}
