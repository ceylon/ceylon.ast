import ceylon.ast.core {
    Block,
    FailClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    failClauseToCeylon,
    parseFailClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElseClause=ElseClause
    }
}

shared object failClause satisfies ConcreteTest<FailClause,JElseClause> {
    
    String->FailClause construct(String->Block block)
            => "else ``block.key``" -> FailClause(block.item);
    
    shared String->FailClause printHelloWorldFailClause = construct(block.printHelloWorldBlock);
    
    parse = parseFailClause;
    fromCeylon = RedHatTransformer.transformFailClause;
    toCeylon = failClauseToCeylon;
    codes = [printHelloWorldFailClause];
}
