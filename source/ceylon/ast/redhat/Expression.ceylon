import ceylon.ast.core {
    Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPrimary=Primary,
        JTerm=Term
    }
}

"Converts a RedHat AST [[Term|JTerm]] to a `ceylon.ast` [[Expression]]."
shared Expression expressionToCeylon(JTerm term) {
    switch (term)
    case (is JPrimary) { return valueExpressionToCeylon(term); }
    else {
        throw AssertionError("Other JTerm types not yet implemented");
    }
}

"Compiles the given [[code]] for an Expression
 into an [[Expression]] using the Ceylon compiler
 (more specifically, the rule for an `expression`)."
shared Expression? compileExpression(String code) {
    if (exists jExpression = createParser(code).expression()) {
        return expressionToCeylon(jExpression);
    } else {
        return null;
    }
}
