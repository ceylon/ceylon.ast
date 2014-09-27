import ceylon.ast.core {
    ExistsOperation,
    SpanningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    existsOperationToCeylon,
    compileExistsOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExists=Exists
    }
}

shared object existsOperation satisfies ConcreteTest<ExistsOperation,JExists> {
    
    String->ExistsOperation construct(String->SpanningExpression operand)
            => "``operand.key`` exists"->ExistsOperation(operand.item);
    
    shared String->ExistsOperation aExistsExpression = construct(baseExpression.aExpression);
    
    compile = compileExistsOperation;
    fromCeylon = RedHatTransformer.transformExistsOperation;
    toCeylon = existsOperationToCeylon;
    codes = [aExistsExpression];
}
