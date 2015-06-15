import ceylon.ast.core {
    ExistsOperation,
    Node,
    SpanningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JExists=Exists
    }
}

"Converts a RedHat AST [[Exists|JExists]] to a `ceylon.ast` [[ExistsOperation]]."
shared ExistsOperation existsOperationToCeylon(JExists existsOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is SpanningExpression operand = expressionToCeylon(existsOperation.term, update));
    value result = ExistsOperation(operand);
    update(existsOperation, result);
    return result;
}

"Compiles the given [[code]] for an Exists Operation
 into an [[ExistsOperation]] using the Ceylon compiler
 (more specifically, the rule for an `existenceEmptinessExpression`)."
shared ExistsOperation? compileExistsOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JExists jExistenceEmptinessExpression = createParser(code).existenceEmptinessExpression()) {
        return existsOperationToCeylon(jExistenceEmptinessExpression, update);
    } else {
        return null;
    }
}
