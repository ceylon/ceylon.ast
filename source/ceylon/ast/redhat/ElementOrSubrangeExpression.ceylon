import ceylon.ast.core {
    ElementOrSubrangeExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIndexExpression=IndexExpression
    }
}

"Converts a RedHat AST [[IndexExpression|JIndexExpression]] to a `ceylon.ast` [[ElementOrSubrangeExpression]]."
shared ElementOrSubrangeExpression elementOrSubrangeExpressionToCeylon(JIndexExpression elementOrSubrangeExpression, Anything(JNode, Node) update = noop) {
    value result = ElementOrSubrangeExpression(primaryToCeylon(elementOrSubrangeExpression.primary, update), subscriptToCeylon(elementOrSubrangeExpression.elementOrRange, update));
    update(elementOrSubrangeExpression, result);
    return result;
}

"Parses the given [[code]] for an Element Or Subrange Expression
 into an [[ElementOrSubrangeExpression]] using the Ceylon compiler
 (more specifically, the rule for a `primary`)."
shared ElementOrSubrangeExpression? parseElementOrSubrangeExpression(String code, Anything(JNode, Node) update = noop) {
    if (is JIndexExpression jPrimary = createParser(code).primary()) {
        return elementOrSubrangeExpressionToCeylon(jPrimary, update);
    } else {
        return null;
    }
}
