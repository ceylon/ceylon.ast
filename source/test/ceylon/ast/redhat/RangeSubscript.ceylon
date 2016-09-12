import ceylon.ast.core {
    RangeSubscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    rangeSubscriptToCeylon,
    parseRangeSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

shared object rangeSubscript satisfies AbstractTest<RangeSubscript,JElementRange> {
    parse = parseRangeSubscript;
    fromCeylon = RedHatTransformer.transformRangeSubscript;
    toCeylon = rangeSubscriptToCeylon;
    
    tests = [spanSubscript, measureSubscript, spanFromSubscript, spanToSubscript];
}
