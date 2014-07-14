import ceylon.ast.core {
    ExistsOperation,
    Precedence9Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExists=Exists
    }
}

"Converts a RedHat AST [[Exists|JExists]] to a `ceylon.ast` [[ExistsOperation]]."
shared ExistsOperation existsOperationToCeylon(JExists existsOperation) {
    "Check precedence"
    assert (is Precedence9Expression child = expressionToCeylon(existsOperation.term));
    return ExistsOperation(child);
}

"Compiles the given [[code]] for an Exists Operation
 into an [[ExistsOperation]] using the Ceylon compiler
 (more specifically, the rule for an `existenceEmptinessExpression`)."
shared ExistsOperation? compileExistsOperation(String code) {
    if (is JExists jExistenceEmptinessExpression = createParser(code).existenceEmptinessExpression()) {
        return existsOperationToCeylon(jExistenceEmptinessExpression);
    } else {
        return null;
    }
}
