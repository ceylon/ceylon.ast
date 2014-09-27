import ceylon.ast.core {
    AndOperation,
    NegatingExpression,
    ConjoiningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    andOperationToCeylon,
    compileAndOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAndOp=AndOp
    }
}

shared object andOperation satisfies ConcreteTest<AndOperation,JAndOp> {
    
    String->AndOperation construct(String->ConjoiningExpression left, String->NegatingExpression right)
            => "``left.key``&&``right.key``"->AndOperation(left.item, right.item);
    
    shared String->AndOperation aAndBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileAndOperation;
    fromCeylon = RedHatTransformer.transformAndOperation;
    toCeylon = andOperationToCeylon;
    codes = [aAndBExpression];
}
