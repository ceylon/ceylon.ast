import ceylon.ast.core {
    NegationOperation,
    Precedence2Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    negationOperationToCeylon,
    compileNegationOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNegativeOp=NegativeOp
    }
}

shared object negationOperation satisfies ConcreteTest<NegationOperation,JNegativeOp> {
    
    String->NegationOperation construct(String->Precedence2Expression child)
            => "-``child.key``"->NegationOperation(child.item);
    
    shared String->NegationOperation minus1138Expression = construct(integerLiteral._1138IntegerLiteral);
    shared String->NegationOperation minusPowExpression = construct(exponentiationOperation._1138Pow1Operation);
    
    compile = compileNegationOperation;
    fromCeylon = RedHatTransformer.transformNegationOperation;
    toCeylon = negationOperationToCeylon;
    codes = [minus1138Expression, minusPowExpression];
}
