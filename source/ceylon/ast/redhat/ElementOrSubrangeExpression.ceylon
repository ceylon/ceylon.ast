import ceylon.ast.core {
    ElementOrSubrangeExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIndexExpression=IndexExpression
    }
}

"Converts a RedHat AST [[IndexExpression|JIndexExpression]] to a `ceylon.ast` [[ElementOrSubrangeExpression]]."
shared ElementOrSubrangeExpression elementOrSubrangeExpressionToCeylon(JIndexExpression elementOrSubrangeExpression) {
    return ElementOrSubrangeExpression(primaryToCeylon(elementOrSubrangeExpression.primary), subscriptToCeylon(elementOrSubrangeExpression.elementOrRange));
}

"Compiles the given [[code]] for an Element Or Subrange Expression
 into an [[ElementOrSubrangeExpression]] using the Ceylon compiler
 (more specifically, the rule for a `primary`)."
shared ElementOrSubrangeExpression? compileElementOrSubrangeExpression(String code) {
    if (is JIndexExpression jPrimary = createParser(code).primary()) {
        return elementOrSubrangeExpressionToCeylon(jPrimary);
    } else {
        return null;
    }
}
