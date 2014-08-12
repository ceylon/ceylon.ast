import ceylon.ast.core {
    ElseClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElseClause=ElseClause,
        JIfStatement=IfStatement
    }
}

"Converts a RedHat AST [[ElseClause|JElseClause]] to a `ceylon.ast` [[ElseClause]]."
shared ElseClause elseClauseToCeylon(JElseClause elseClause) {
    if (elseClause.block.mainToken exists) {
        // it’s a proper block
        return ElseClause(blockToCeylon(elseClause.block));
    } else {
        // it’s an ‘else if’, but the AST doesn’t have that,
        // so the parser wraps it in a single-statement block
        // without a main token
        assert (elseClause.block.statements.size() == 1,
            is JIfStatement elseIf = elseClause.block.statements.get(0));
        return ElseClause(ifElseToCeylon(elseIf));
    }
}

"Compiles the given [[code]] for an Else Clause
 into an [[ElseClause]] using the Ceylon compiler
 (more specifically, the rule for an `elseBlock`)."
shared ElseClause? compileElseClause(String code) {
    if (exists jElseBlock = createParser(code).elseBlock()) {
        return elseClauseToCeylon(jElseBlock);
    } else {
        return null;
    }
}
