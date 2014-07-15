import ceylon.ast.core {
    NonemptyOperation,
    Precedence9Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNonempty=Nonempty
    }
}

"Converts a RedHat AST [[Nonempty|JNonempty]] to a `ceylon.ast` [[NonemptyOperation]]."
shared NonemptyOperation nonemptyOperationToCeylon(JNonempty nonemptyOperation) {
    "Check precedence"
    assert (is Precedence9Expression operand = expressionToCeylon(nonemptyOperation.term));
    return NonemptyOperation(operand);
}

"Compiles the given [[code]] for a Nonempty Operation
 into a [[NonemptyOperation]] using the Ceylon compiler
 (more specifically, the rule for a `existenceEmptinessExpression`)."
shared NonemptyOperation? compileNonemptyOperation(String code) {
    if (is JNonempty jExistenceEmptinessExpression = createParser(code).existenceEmptinessExpression()) {
        return nonemptyOperationToCeylon(jExistenceEmptinessExpression);
    } else {
        return null;
    }
}
