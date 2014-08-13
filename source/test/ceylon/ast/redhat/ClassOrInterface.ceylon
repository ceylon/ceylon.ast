import ceylon.ast.core {
    ClassOrInterface
}
import ceylon.ast.redhat {
    RedHatTransformer,
    classOrInterfaceToCeylon,
    compileClassOrInterface
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassOrInterface=ClassOrInterface
    }
}

shared object classOrInterface satisfies AbstractTest<ClassOrInterface,JClassOrInterface> {
    compile = compileClassOrInterface;
    fromCeylon = RedHatTransformer.transformClassOrInterface;
    toCeylon = classOrInterfaceToCeylon;
    
    tests = [anyClass];
}
