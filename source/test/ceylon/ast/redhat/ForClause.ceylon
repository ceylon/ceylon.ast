import ceylon.ast.core {
    Block,
    ForClause,
    ForIterator
}
import ceylon.ast.redhat {
    RedHatTransformer,
    forClauseToCeylon,
    parseForClause
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JForClause=ForClause
    }
}

shared object forClause satisfies ConcreteTest<ForClause,JForClause> {
    
    String->ForClause construct(String->ForIterator iterator, String->Block block)
            => "for``iterator.key````block.key``" -> ForClause(iterator.item, block.item);
    
    shared String->ForClause printPersonNameInPeopleForClause = construct(forIterator.variableIterator, block.printPersonNameBlock);
    
    parse = parseForClause;
    fromCeylon = RedHatTransformer.transformForClause;
    toCeylon = forClauseToCeylon;
    codes = [printPersonNameInPeopleForClause];
}
