import ceylon.ast.core {
    Declaration
}
import ceylon.ast.redhat {
    RedHatTransformer,
    declarationToCeylon,
    compileDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDeclaration=Declaration
    }
}

shared object declaration satisfies AbstractTest<Declaration,JDeclaration> {
    compile = compileDeclaration;
    fromCeylon = RedHatTransformer.transformDeclaration;
    toCeylon = declarationToCeylon;
    
    tests => [nothing]; // TODO add tests!
    /*
     TODO also: make eager again (‘=’ → ‘=>’). Needs to be lazy right now
     because otherwise it will throw when the class is loaded, and ceylon.test
     can’t catch that
     */
}
