import ceylon.ast.core {
    Block,
    ElseCaseClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    elseCaseClauseToCeylon,
    compileElseCaseClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElseClause=ElseClause
    }
}

shared object elseCaseClause satisfies ConcreteTest<ElseCaseClause,JElseClause> {
    
    String->ElseCaseClause construct(String->Block block)
            => "else ``block.key``"->ElseCaseClause(block.item);
    
    shared String->ElseCaseClause elsePrintHelloWorldCaseClause = construct(block.printHelloWorldBlock);
    
    compile = compileElseCaseClause;
    fromCeylon = RedHatTransformer.transformElseCaseClause;
    toCeylon = elseCaseClauseToCeylon;
    codes = [elsePrintHelloWorldCaseClause];
}
