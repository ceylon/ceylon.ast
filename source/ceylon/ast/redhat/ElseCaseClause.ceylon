import ceylon.ast.core {
    ElseCaseClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElseClause=ElseClause
    }
}

"Converts a RedHat AST [[ElseClause|JElseClause]] to a `ceylon.ast` [[ElseCaseClause]]."
throws (`class AssertionError`, "If the else clause’s block isn’t a real block (i. e., an ‘`else if`’ construct)")
shared ElseCaseClause elseCaseClauseToCeylon(JElseClause elseCaseClause) {
    "Must not be a synthetic (if-else) block"
    assert (elseCaseClause.block.mainToken exists);
    return ElseCaseClause(blockToCeylon(elseCaseClause.block));
}

"Compiles the given [[code]] for an Else Case Clause
 into an [[ElseCaseClause]] using the Ceylon compiler
 (more specifically, the rule for a `defaultCaseBlock`)."
shared ElseCaseClause? compileElseCaseClause(String code) {
    if (exists jDefaultCaseBlock = createParser(code).defaultCaseBlock()) {
        return elseCaseClauseToCeylon(jDefaultCaseBlock);
    } else {
        return null;
    }
}
