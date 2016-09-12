import ceylon.ast.core {
    TypeDeclaration
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeDeclarationToCeylon,
    parseTypeDeclaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeDeclaration=TypeDeclaration
    }
}

shared object typeDeclaration satisfies AbstractTest<TypeDeclaration,JTypeDeclaration> {
    parse = parseTypeDeclaration;
    fromCeylon = RedHatTransformer.transformTypeDeclaration;
    toCeylon = typeDeclarationToCeylon;
    
    tests = [classOrInterface, typeAliasDefinition];
}
