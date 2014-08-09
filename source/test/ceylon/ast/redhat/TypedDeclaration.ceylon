import ceylon.ast.core {
    TypedDeclaration
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typedDeclarationToCeylon,
    compileTypedDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypedDeclaration=TypedDeclaration
    }
}

shared object typedDeclaration satisfies AbstractTest<TypedDeclaration,JTypedDeclaration> {
    compile = compileTypedDeclaration;
    fromCeylon = RedHatTransformer.transformTypedDeclaration;
    toCeylon = typedDeclarationToCeylon;
    
    tests = [anyValue, anyFunction];
}
