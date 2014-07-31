import ceylon.ast.core {
    Variance
}
import ceylon.ast.redhat {
    RedHatTransformer,
    varianceToCeylon,
    compileVariance
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeVariance=TypeVariance
    }
}

shared object variance satisfies AbstractTest<Variance,JTypeVariance> {
    compile = compileVariance;
    fromCeylon = RedHatTransformer.transformVariance;
    toCeylon = varianceToCeylon;
    
    tests = [inModifier, outModifier];
}
