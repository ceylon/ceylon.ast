import ceylon.ast.core {
    Block,
    ElseClause,
    IfElse
}
import ceylon.ast.redhat {
    RedHatTransformer,
    elseClauseToCeylon,
    parseElseClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElseClause=ElseClause
    }
}

shared object elseClause satisfies ConcreteTest<ElseClause,JElseClause> {
    
    String->ElseClause construct(String->Block|IfElse child)
            => "else ``child.key``" -> ElseClause(child.item);
    
    shared String->ElseClause emptyElseClause => construct(block.emptyBlock);
    shared String->ElseClause emptyElseIfClause => construct(ifElse.emptyIf);
    shared String->ElseClause elsePrintHelloWorldClause = construct(block.printHelloWorldBlock);
    
    parse = parseElseClause;
    fromCeylon = RedHatTransformer.transformElseClause;
    toCeylon = elseClauseToCeylon;
    codes => [emptyElseClause, emptyElseIfClause, elsePrintHelloWorldClause];
}
