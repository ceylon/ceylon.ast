import ceylon.ast.core {
    Pattern
}
import ceylon.ast.redhat {
    RedHatTransformer,
    patternToCeylon,
    compilePattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPattern=Pattern
    }
}

shared object pattern satisfies AbstractTest<Pattern,JPattern> {
    compile = compilePattern;
    fromCeylon = RedHatTransformer.transformPattern;
    toCeylon = patternToCeylon;
    
    tests = [variablePattern, tuplePattern, entryPattern];
}
