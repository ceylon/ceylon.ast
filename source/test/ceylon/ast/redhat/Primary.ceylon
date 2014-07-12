import ceylon.ast.core {
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    primaryToCeylon,
    compilePrimary
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPrimary=Primary
    }
}

shared object primary satisfies AbstractTest<Primary,JPrimary> {
    compile = compilePrimary;
    fromCeylon = RedHatTransformer.transformPrimary;
    toCeylon = primaryToCeylon;
    
    tests = [atom, baseExpression, qualifiedExpression]; // TODO add meta and dec tests!
}
