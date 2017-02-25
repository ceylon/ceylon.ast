import ceylon.ast.core {
    Node,
    NonemptyOperation,
    SpanningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JNonempty=Nonempty
    }
}

"Converts a RedHat AST [[Nonempty|JNonempty]] to a `ceylon.ast` [[NonemptyOperation]]."
shared NonemptyOperation nonemptyOperationToCeylon(JNonempty nonemptyOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is SpanningExpression operand = expressionToCeylon(nonemptyOperation.term, update));
    value result = NonemptyOperation(operand);
    update(nonemptyOperation, result);
    return result;
}

"Parses the given [[code]] for a Nonempty Operation
 into a [[NonemptyOperation]] using the Ceylon compiler
 (more specifically, the rule for a `existenceEmptinessExpression`)."
shared NonemptyOperation? parseNonemptyOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JNonempty jExistenceEmptinessExpression = createParser(code).existenceEmptinessExpression()) {
        return nonemptyOperationToCeylon(jExistenceEmptinessExpression, update);
    } else {
        return null;
    }
}
