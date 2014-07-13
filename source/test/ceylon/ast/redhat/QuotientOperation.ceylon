import ceylon.ast.core {
    Precedence5Expression,
    Precedence6Expression,
    QuotientOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    quotientOperationToCeylon,
    compileQuotientOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JQuotientOp=QuotientOp
    }
}

shared object quotientOperation satisfies ConcreteTest<QuotientOperation,JQuotientOp> {
    
    String->QuotientOperation construct(String->Precedence6Expression left, String->Precedence5Expression right)
            => "``left.key``/``right.key``"->QuotientOperation(left.item, right.item);
    
    shared String->QuotientOperation minus1138Divide1138Expression = construct(negationOperation.minus1138Expression, integerLiteral._1138IntegerLiteral);
    
    compile = compileQuotientOperation;
    fromCeylon = RedHatTransformer.transformQuotientOperation;
    toCeylon = quotientOperationToCeylon;
    codes = [minus1138Divide1138Expression];
}
