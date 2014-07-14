import ceylon.ast.core {
    ExistsOperation,
    Precedence9Expression
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
    
    String->ExistsOperation construct(String->Precedence9Expression child)
            => "``child.key`` exists"->ExistsOperation(child.item);
    
    shared String->ExistsOperation aExistsExpression = construct(baseExpression.aExpression);
    
    compile = compileExistsOperation;
    fromCeylon = RedHatTransformer.transformExistsOperation;
    toCeylon = existsOperationToCeylon;
    codes = [aExistsExpression];
}
