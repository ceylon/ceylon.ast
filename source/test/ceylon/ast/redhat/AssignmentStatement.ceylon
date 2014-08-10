import ceylon.ast.core {
    AssignmentOperation,
    AssignmentStatement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    assignmentStatementToCeylon,
    compileAssignmentStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpressionStatement=ExpressionStatement
    }
}

shared object assignmentStatement satisfies ConcreteTest<AssignmentStatement,JExpressionStatement> {
    
    String->AssignmentStatement construct(String->AssignmentOperation expression)
            => "``expression.key``;"->AssignmentStatement(expression.item);
    
    shared String->AssignmentStatement nameEmptyAssignTrueStatement = construct(assignOperation.nameEmptyAssignTrueExpression);
    shared String->AssignmentStatement iAddAssignStepStatement = construct(addAssignmentOperation.iAddAssignStepExpression);
    shared String->AssignmentStatement aIntersectAssignBStatement = construct(intersectAssignmentOperation.aIntersectAssignBExpression);
    
    compile = compileAssignmentStatement;
    fromCeylon = RedHatTransformer.transformAssignmentStatement;
    toCeylon = assignmentStatementToCeylon;
    codes = [iAddAssignStepStatement];
}
