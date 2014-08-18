import ceylon.ast.core {
    FailClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElseClause=ElseClause
    }
}

"Converts a RedHat AST [[ElseClause|JElseClause]] to a `ceylon.ast` [[FailClause]]."
shared FailClause failClauseToCeylon(JElseClause failClause) {
    assert (exists jBlock = failClause.block);
    "Must not be an “anonymous” block (as generated for an else-if clause)."
    assert (jBlock.mainToken exists);
    return FailClause(blockToCeylon(jBlock));
}

"Compiles the given [[code]] for a Fail Clause
 into a [[FailClause]] using the Ceylon compiler
 (more specifically, the rule for a `failBlock`)."
shared FailClause? compileFailClause(String code) {
    if (exists jFailBlock = createParser(code).failBlock()) {
        return failClauseToCeylon(jFailBlock);
    } else {
        return null;
    }
}
