import ceylon.ast.core {
    AnyValue
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyValueToCeylon,
    parseAnyValue
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyAttribute=AnyAttribute
    }
}

shared object anyValue satisfies AbstractTest<AnyValue,JAnyAttribute> {
    parse = parseAnyValue;
    fromCeylon = RedHatTransformer.transformAnyValue;
    toCeylon = anyValueToCeylon;
    
    tests = [valueDeclaration, valueDefinition, valueGetterDefinition];
}
