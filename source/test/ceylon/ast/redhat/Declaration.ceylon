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
    
    tests = [typeDeclaration, typedDeclaration, objectDefinition, valueSetterDefinition];
}
