import ceylon.ast.core {
    KeySubscript,
    AddingExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElement=Element
    }
}

"Converts a RedHat AST [[Element|JElement]] to a `ceylon.ast` [[KeySubscript]]."
shared KeySubscript keySubscriptToCeylon(JElement keySubscript) {
    "Check precedence"
    assert (is AddingExpression key = expressionToCeylon(keySubscript.expression));
    return KeySubscript(key);
}

"Compiles the given [[code]] for a Key Subscript
 into a [[KeySubscript]] using the Ceylon compiler
 (more specifically, the rule for a `indexOrIndexRange`)."
shared KeySubscript? compileKeySubscript(String code) {
    if (is JElement jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange) {
        return keySubscriptToCeylon(jElementOrRange);
    } else {
        return null;
    }
}
