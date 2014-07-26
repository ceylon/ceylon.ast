import ceylon.ast.core {
    AnySpecifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anySpecifierToCeylon,
    compileAnySpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifierExpression=SpecifierExpression
    }
}

shared object anySpecifier satisfies AbstractTest<AnySpecifier,JSpecifierExpression> {
    compile = compileAnySpecifier;
    fromCeylon = RedHatTransformer.transformAnySpecifier;
    toCeylon = anySpecifierToCeylon;
    
    tests = [specifier, lazySpecifier];
}
