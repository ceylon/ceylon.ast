import ceylon.ast.core {
    AnyAttribute
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyAttributeToCeylon,
    compileAnyAttribute
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyAttribute=AnyAttribute
    }
}

shared object anyAttribute satisfies AbstractTest<AnyAttribute,JAnyAttribute> {
    compile = compileAnyAttribute;
    fromCeylon = RedHatTransformer.transformAnyAttribute;
    toCeylon = anyAttributeToCeylon;
    
    tests = [attributeDeclaration];
}
