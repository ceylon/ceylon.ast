import ceylon.ast.core {
    AnyClass
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyClassToCeylon,
    compileAnyClass
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyClass=AnyClass
    }
}

shared object anyClass satisfies AbstractTest<AnyClass,JAnyClass> {
    compile = compileAnyClass;
    fromCeylon = RedHatTransformer.transformAnyClass;
    toCeylon = anyClassToCeylon;
    
    tests = [classDefinition, classAlias];
}
