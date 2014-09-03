import ceylon.ast.core {
    AnyInterface
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyInterfaceToCeylon,
    compileAnyInterface
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyInterface=AnyInterface
    }
}

shared object anyInterface satisfies AbstractTest<AnyInterface,JAnyInterface> {
    compile = compileAnyInterface;
    fromCeylon = RedHatTransformer.transformAnyInterface;
    toCeylon = anyInterfaceToCeylon;
    
    tests = [anyInterfaceDefinition];
}
