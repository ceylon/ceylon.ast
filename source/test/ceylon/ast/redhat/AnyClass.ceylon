import ceylon.ast.core {
    AnyClass
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyClassToCeylon,
    parseAnyClass
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyClass=AnyClass
    }
}

shared object anyClass satisfies AbstractTest<AnyClass,JAnyClass> {
    parse = parseAnyClass;
    fromCeylon = RedHatTransformer.transformAnyClass;
    toCeylon = anyClassToCeylon;
    
    tests = [classDefinition, classAliasDefinition];
}
