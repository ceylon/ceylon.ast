import ceylon.ast.core {
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    primaryToCeylon,
    parsePrimary
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JPrimary=Primary
    }
}

shared object primary satisfies AbstractTest<Primary,JPrimary> {
    parse = parsePrimary;
    fromCeylon = RedHatTransformer.transformPrimary;
    toCeylon = primaryToCeylon;
    
    tests = [atom, baseExpression, qualifiedExpression, invocation, elementOrSubrangeExpression, meta, dec, objectExpression];
}
