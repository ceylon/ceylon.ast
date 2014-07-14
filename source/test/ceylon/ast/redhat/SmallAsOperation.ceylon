import ceylon.ast.core {
    Precedence10Expression,
    SmallAsOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    smallAsOperationToCeylon,
    compileSmallAsOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSmallAsOp=SmallAsOp
    }
}

shared object smallAsOperation satisfies ConcreteTest<SmallAsOperation,JSmallAsOp> {
    
    String->SmallAsOperation construct(String->Precedence10Expression left, String->Precedence10Expression right)
            => "``left.key``<=``right.key``"->SmallAsOperation(left.item, right.item);
    
    shared String->SmallAsOperation _1138LargeAs1Expression = construct(integerLiteral._1138IntegerLiteral, integerLiteral.oneIntegerLiteral);
    
    compile = compileSmallAsOperation;
    fromCeylon = RedHatTransformer.transformSmallAsOperation;
    toCeylon = smallAsOperationToCeylon;
    codes = [_1138LargeAs1Expression];
}
