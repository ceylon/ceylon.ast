import ceylon.ast.core {
    ExistsNonemptyExpression,
    SmallerOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    smallerOperationToCeylon,
    parseSmallerOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSmallerOp=SmallerOp
    }
}

shared object smallerOperation satisfies ConcreteTest<SmallerOperation,JSmallerOp> {
    
    String->SmallerOperation construct(String->ExistsNonemptyExpression left, String->ExistsNonemptyExpression right)
            => "``left.key``<``right.key``" -> SmallerOperation(left.item, right.item);
    
    shared String->SmallerOperation _1138SmallerExpression = construct(integerLiteral._1138IntegerLiteral, integerLiteral.oneIntegerLiteral);
    
    parse = parseSmallerOperation;
    fromCeylon = RedHatTransformer.transformSmallerOperation;
    toCeylon = smallerOperationToCeylon;
    codes = [_1138SmallerExpression];
}
