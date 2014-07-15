import ceylon.ast.core {
    AndOperation,
    Precedence13Expression,
    Precedence14Expression
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
    
    String->AndOperation construct(String->Precedence14Expression left, String->Precedence13Expression right)
            => "``left.key``&&``right.key``"->AndOperation(left.item, right.item);
    
    shared String->AndOperation aAndBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileAndOperation;
    fromCeylon = RedHatTransformer.transformAndOperation;
    toCeylon = andOperationToCeylon;
    codes = [aAndBExpression];
}
