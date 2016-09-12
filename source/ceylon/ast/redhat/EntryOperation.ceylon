import ceylon.ast.core {
    EntryOperation,
    AddingExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JEntryOp=EntryOp
    }
}

"Converts a RedHat AST [[EntryOp|JEntryOp]] to a `ceylon.ast` [[EntryOperation]]."
shared EntryOperation entryOperationToCeylon(JEntryOp entryOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is AddingExpression left = expressionToCeylon(entryOperation.leftTerm, update),
        is AddingExpression right = expressionToCeylon(entryOperation.rightTerm, update));
    value result = EntryOperation(left, right);
    update(entryOperation, result);
    return result;
}

"Parses the given [[code]] for an Entry Operation
 into an [[EntryOperation]] using the Ceylon compiler
 (more specifically, the rule for an `entryRangeExpression`)."
shared EntryOperation? parseEntryOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JEntryOp jEntryRangeExpression = createParser(code).entryRangeExpression()) {
        return entryOperationToCeylon(jEntryRangeExpression, update);
    } else {
        return null;
    }
}
