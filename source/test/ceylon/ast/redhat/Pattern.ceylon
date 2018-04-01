import ceylon.ast.core {
    Pattern
}
import ceylon.ast.redhat {
    RedHatTransformer,
    patternToCeylon,
    parsePattern
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JPattern=Pattern
    }
}

shared object pattern satisfies AbstractTest<Pattern,JPattern> {
    parse = parsePattern;
    fromCeylon = RedHatTransformer.transformPattern;
    toCeylon = patternToCeylon;
    
    tests = [variablePattern, tuplePattern, entryPattern];
}
