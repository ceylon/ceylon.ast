import ceylon.ast.core {
    IfElse,
    ElseClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfStatement=IfStatement
    }
}

"Converts a RedHat AST [[IfStatement|JIfStatement]] to a `ceylon.ast` [[IfElse]]."
shared IfElse ifElseToCeylon(JIfStatement ifElse) {
    ElseClause? elseClause;
    if (exists jElseClause = ifElse.elseClause) {
        elseClause = elseClauseToCeylon(jElseClause);
    } else {
        elseClause = null;
    }
    return IfElse(ifClauseToCeylon(ifElse.ifClause), elseClause);
}

"Compiles the given [[code]] for an If Else
 into an [[IfElse]] using the Ceylon compiler
 (more specifically, the rule for an `ifElse`)."
shared IfElse? compileIfElse(String code) {
    if (exists jIfElse = createParser(code).ifElse()) {
        return ifElseToCeylon(jIfElse);
    } else {
        return null;
    }
}
