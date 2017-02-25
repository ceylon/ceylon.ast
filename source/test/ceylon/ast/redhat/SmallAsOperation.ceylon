import ceylon.ast.core {
    ExistsNonemptyExpression,
    SmallAsOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    smallAsOperationToCeylon,
    parseSmallAsOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSmallAsOp=SmallAsOp
    }
}

shared object smallAsOperation satisfies ConcreteTest<SmallAsOperation,JSmallAsOp> {
    
    String->SmallAsOperation construct(String->ExistsNonemptyExpression left, String->ExistsNonemptyExpression right)
            => "``left.key``<=``right.key``" -> SmallAsOperation(left.item, right.item);
    
    shared String->SmallAsOperation _1138LargeAs1Expression = construct(integerLiteral._1138IntegerLiteral, integerLiteral.oneIntegerLiteral);
    
    parse = parseSmallAsOperation;
    fromCeylon = RedHatTransformer.transformSmallAsOperation;
    toCeylon = smallAsOperationToCeylon;
    codes = [_1138LargeAs1Expression];
}
