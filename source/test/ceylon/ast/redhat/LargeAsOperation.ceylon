import ceylon.ast.core {
    LargeAsOperation,
    Precedence10Expression
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
    
    String->LargeAsOperation construct(String->Precedence10Expression left, String->Precedence10Expression right)
            => "``left.key``>=``right.key``"->LargeAsOperation(left.item, right.item);
    
    shared String->LargeAsOperation _1138LargeAs1Expression = construct(integerLiteral._1138IntegerLiteral, integerLiteral.oneIntegerLiteral);
    
    compile = compileLargeAsOperation;
    fromCeylon = RedHatTransformer.transformLargeAsOperation;
    toCeylon = largeAsOperationToCeylon;
    codes = [_1138LargeAs1Expression];
}
