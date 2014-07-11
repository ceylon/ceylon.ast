import ceylon.ast.core {
    PostfixOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    postfixOperationToCeylon,
    compilePostfixOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPostfixOperatorExpression=PostfixOperatorExpression
    }
}

shared object postfixOperation satisfies AbstractTest<PostfixOperation,JPostfixOperatorExpression> {
    compile = compilePostfixOperation;
    fromCeylon = RedHatTransformer.transformPostfixOperation;
    toCeylon = postfixOperationToCeylon;
    
    tests = [postfixDecrementOperation, postfixIncrementOperation];
}
