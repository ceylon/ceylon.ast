import ceylon.ast.core {
    EntryOperation,
    AddingExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEntryOp=EntryOp
    }
}

"Converts a RedHat AST [[EntryOp|JEntryOp]] to a `ceylon.ast` [[EntryOperation]]."
shared EntryOperation entryOperationToCeylon(JEntryOp entryOperation) {
    "Check precedence"
    assert (is AddingExpression left = expressionToCeylon(entryOperation.leftTerm),
        is AddingExpression right = expressionToCeylon(entryOperation.rightTerm));
    return EntryOperation(left, right);
}

"Compiles the given [[code]] for an Entry Operation
 into an [[EntryOperation]] using the Ceylon compiler
 (more specifically, the rule for an `entryRangeExpression`)."
shared EntryOperation? compileEntryOperation(String code) {
    if (is JEntryOp jEntryRangeExpression = createParser(code).entryRangeExpression()) {
        return entryOperationToCeylon(jEntryRangeExpression);
    } else {
        return null;
    }
}
