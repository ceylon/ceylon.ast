import ceylon.ast.core {
    TypedDeclaration
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typedDeclarationToCeylon,
    parseTypedDeclaration
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JTypedDeclaration=TypedDeclaration
    }
}

shared object typedDeclaration satisfies AbstractTest<TypedDeclaration,JTypedDeclaration> {
    parse = parseTypedDeclaration;
    fromCeylon = RedHatTransformer.transformTypedDeclaration;
    toCeylon = typedDeclarationToCeylon;
    
    tests = [anyValue, anyFunction];
}
