import ceylon.ast.core {
    Node,
    While
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JWhileStatement=WhileStatement
    }
}

"Converts a RedHat AST [[WhileStatement|JWhileStatement]] to a `ceylon.ast` [[While]]."
shared While whileToCeylon(JWhileStatement \iwhile, Anything(JNode, Node) update = noop) {
    value result = While(conditionsToCeylon(\iwhile.whileClause.conditionList, update), blockToCeylon(\iwhile.whileClause.block, update));
    update(\iwhile, result);
    return result;
}

"Parses the given [[code]] for a While
 into a [[While]] using the Ceylon compiler
 (more specifically, the rule for a `whileLoop`)."
shared While? parseWhile(String code, Anything(JNode, Node) update = noop) {
    if (exists jWhileLoop = createParser(code).whileLoop()) {
        return whileToCeylon(jWhileLoop, update);
    } else {
        return null;
    }
}
