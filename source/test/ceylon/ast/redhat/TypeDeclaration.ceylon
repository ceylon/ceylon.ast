import ceylon.ast.core {
    TypeDeclaration
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeDeclarationToCeylon,
    compileTypeDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeDeclaration=TypeDeclaration
    }
}

shared object typeDeclaration satisfies AbstractTest<TypeDeclaration,JTypeDeclaration> {
    compile = compileTypeDeclaration;
    fromCeylon = RedHatTransformer.transformTypeDeclaration;
    toCeylon = typeDeclarationToCeylon;
    
    tests = [classOrInterface, typeAliasDefinition];
}
