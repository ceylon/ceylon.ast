import ceylon.ast.core {
    LargeAsOperation,
    ExistsNonemptyExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    largeAsOperationToCeylon,
    compileLargeAsOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLargeAsOp=LargeAsOp
    }
}

shared object largeAsOperation satisfies ConcreteTest<LargeAsOperation,JLargeAsOp> {
    
    String->LargeAsOperation construct(String->ExistsNonemptyExpression left, String->ExistsNonemptyExpression right)
            => "``left.key``>=``right.key``"->LargeAsOperation(left.item, right.item);
    
    shared String->LargeAsOperation _1138LargeAs1Expression = construct(integerLiteral._1138IntegerLiteral, integerLiteral.oneIntegerLiteral);
    
    compile = compileLargeAsOperation;
    fromCeylon = RedHatTransformer.transformLargeAsOperation;
    toCeylon = largeAsOperationToCeylon;
    codes = [_1138LargeAs1Expression];
}
