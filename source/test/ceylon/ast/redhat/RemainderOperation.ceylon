import ceylon.ast.core {
    UnioningExpression,
    MultiplyingExpression,
    RemainderOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    remainderOperationToCeylon,
    parseRemainderOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JRemainderOp=RemainderOp
    }
}

shared object remainderOperation satisfies ConcreteTest<RemainderOperation,JRemainderOp> {
    
    String->RemainderOperation construct(String->MultiplyingExpression left, String->UnioningExpression right)
            => "``left.key``%``right.key``" -> RemainderOperation(left.item, right.item);
    
    shared String->RemainderOperation _1138Modulo1Expression = construct(integerLiteral._1138IntegerLiteral, integerLiteral.oneIntegerLiteral);
    
    parse = parseRemainderOperation;
    fromCeylon = RedHatTransformer.transformRemainderOperation;
    toCeylon = remainderOperationToCeylon;
    codes = [_1138Modulo1Expression];
}
