import ceylon.ast.core {
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    primaryToCeylon,
    parsePrimary
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
