import ceylon.ast.core {
    Statement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    statementToCeylon,
    compileStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStatement=Statement
    }
}

shared object statement satisfies AbstractTest<Statement,JStatement> {
    compile = compileStatement;
    fromCeylon = RedHatTransformer.transformStatement;
    toCeylon = statementToCeylon;
    
    tests = [specification];
}
