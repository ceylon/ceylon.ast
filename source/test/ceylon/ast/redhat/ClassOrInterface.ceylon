import ceylon.ast.core {
    ClassOrInterface
}
import ceylon.ast.redhat {
    RedHatTransformer,
    classOrInterfaceToCeylon,
    parseClassOrInterface
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JClassOrInterface=ClassOrInterface
    }
}

shared object classOrInterface satisfies AbstractTest<ClassOrInterface,JClassOrInterface> {
    parse = parseClassOrInterface;
    fromCeylon = RedHatTransformer.transformClassOrInterface;
    toCeylon = classOrInterfaceToCeylon;
    
    tests = [anyClass, anyInterface];
}
