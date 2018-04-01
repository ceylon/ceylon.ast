import ceylon.ast.core {
    Block,
    FinallyClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    finallyClauseToCeylon,
    parseFinallyClause
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JFinallyClause=FinallyClause
    }
}

shared object finallyClause satisfies ConcreteTest<FinallyClause,JFinallyClause> {
    
    String->FinallyClause construct(String->Block block)
            => "finally ``block.key``" -> FinallyClause(block.item);
    
    shared String->FinallyClause printHelloWorldFinallyClause = construct(block.printHelloWorldBlock);
    
    parse = parseFinallyClause;
    fromCeylon = RedHatTransformer.transformFinallyClause;
    toCeylon = finallyClauseToCeylon;
    codes = [printHelloWorldFinallyClause];
}
