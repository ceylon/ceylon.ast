import ceylon.ast.core {
    AnySpecifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anySpecifierToCeylon,
    parseAnySpecifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifierExpression=SpecifierExpression
    }
}

shared object anySpecifier satisfies AbstractTest<AnySpecifier,JSpecifierExpression> {
    parse = parseAnySpecifier;
    fromCeylon = RedHatTransformer.transformAnySpecifier;
    toCeylon = anySpecifierToCeylon;
    
    tests = [specifier, lazySpecifier];
}
