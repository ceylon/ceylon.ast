import ceylon.ast.core {
    RangeSubscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    rangeSubscriptToCeylon,
    compileRangeSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

shared object rangeSubscript satisfies AbstractTest<RangeSubscript,JElementRange> {
    compile = compileRangeSubscript;
    fromCeylon = RedHatTransformer.transformRangeSubscript;
    toCeylon = rangeSubscriptToCeylon;
    
    tests = [spanSubscript, measureSubscript, spanFromSubscript, spanToSubscript];
}
