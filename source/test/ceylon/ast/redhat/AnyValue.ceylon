import ceylon.ast.core {
    AnyValue
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyValueToCeylon,
    compileAnyValue
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyAttribute=AnyAttribute
    }
}

shared object anyValue satisfies AbstractTest<AnyValue,JAnyAttribute> {
    compile = compileAnyValue;
    fromCeylon = RedHatTransformer.transformAnyValue;
    toCeylon = anyValueToCeylon;
    
    tests = [valueDeclaration, valueDefinition, valueGetterDefinition];
}
