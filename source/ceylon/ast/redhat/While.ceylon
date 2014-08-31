import ceylon.ast.core {
    While
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JWhileStatement=WhileStatement
    }
}

"Converts a RedHat AST [[WhileStatement|JWhileStatement]] to a `ceylon.ast` [[While]]."
shared While whileToCeylon(JWhileStatement \iwhile) {
    return While(conditionsToCeylon(\iwhile.whileClause.conditionList), blockToCeylon(\iwhile.whileClause.block));
}

"Compiles the given [[code]] for a While
 into a [[While]] using the Ceylon compiler
 (more specifically, the rule for a `whileLoop`)."
shared While? compileWhile(String code) {
    if (exists jWhileLoop = createParser(code).whileLoop()) {
        return whileToCeylon(jWhileLoop);
    } else {
        return null;
    }
}
