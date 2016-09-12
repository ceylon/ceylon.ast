import ceylon.ast.core {
    Continue
}
import ceylon.ast.redhat {
    RedHatTransformer,
    continueToCeylon,
    parseContinue
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JContinue=Continue
    }
}

shared object \icontinue satisfies ConcreteTest<Continue,JContinue> {
    
    shared String->Continue \icontinue = "continue;"->Continue();
    
    parse = parseContinue;
    fromCeylon = RedHatTransformer.transformContinue;
    toCeylon = continueToCeylon;
    codes = [\icontinue];
}
