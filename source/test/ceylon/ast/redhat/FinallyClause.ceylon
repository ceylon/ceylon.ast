import ceylon.ast.core {
    Block,
    FinallyClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    finallyClauseToCeylon,
    compileFinallyClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFinallyClause=FinallyClause
    }
}

shared object finallyClause satisfies ConcreteTest<FinallyClause,JFinallyClause> {
    
    String->FinallyClause construct(String->Block block)
            => "finally ``block.key``"->FinallyClause(block.item);
    
    shared String->FinallyClause printHelloWorldFinallyClause = construct(block.printHelloWorldBlock);
    
    compile = compileFinallyClause;
    fromCeylon = RedHatTransformer.transformFinallyClause;
    toCeylon = finallyClauseToCeylon;
    codes = [printHelloWorldFinallyClause];
}
