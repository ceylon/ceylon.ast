import ceylon.ast.core {
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node
}
import ceylon.ast.redhat {
    RedHatTransformer
}
import ceylon.test {
    assertEquals,
    test
}

void doTest<CeylonAstType,RedHatType>(
    CeylonAstType? compile(String code),
    RedHatType fromCeylon(RedHatTransformer transformer)(CeylonAstType node), CeylonAstType toCeylon(RedHatType node),
    <String->CeylonAstType>+ codes)
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    testCompilation(compile, *codes);
    testConversion(fromCeylon, toCeylon, *codes.collect(Entry<String,CeylonAstType>.item));
}

void testConversion<CeylonAstType,RedHatType>(RedHatType fromCeylon(RedHatTransformer transformer)(CeylonAstType node), CeylonAstType toCeylon(RedHatType node), CeylonAstType+ nodes)
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    for (node in nodes) {
        assertEquals {
            actual = toCeylon(fromCeylon(RedHatTransformer(SimpleTokenFactory()))(node));
            expected = node;
            message = "Double parse of ``node``";
        };
    }
}

void testCompilation<CeylonAstType>(CeylonAstType? compile(String code), <String->CeylonAstType>+ codes)
        given CeylonAstType satisfies Node {
    for (code->node in codes) {
        assert (exists compiled = compile(code));
        assertEquals {
            actual = compiled;
            expected = node;
            message = "Compile '``code``' to '``node``'";
        };
    }
}

// needed for variance – ConcreteTest’s type params
// must be invariant, but we need them 'out' for
// use in AbstractTest
shared interface CodesProvider<out CeylonAstType>
        given CeylonAstType satisfies Node {
    shared formal [<String->CeylonAstType>+] codes;
}

shared interface ConcreteTest<CeylonAstType,RedHatType>
        satisfies CodesProvider<CeylonAstType>
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    
    shared formal CeylonAstType? compile(String code);
    shared formal RedHatType fromCeylon(RedHatTransformer transformer)(CeylonAstType node);
    shared formal CeylonAstType toCeylon(RedHatType node);
    
    test
    shared void compilation() => testCompilation(compile, *codes);
    test
    shared void conversion() => testConversion(fromCeylon, toCeylon, *codes.collect(Entry<String,CeylonAstType>.item));
}

shared interface AbstractTest<CeylonAstType,RedHatType>
        satisfies CodesProvider<CeylonAstType>
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    
    shared formal CeylonAstType? compile(String code);
    shared formal RedHatType fromCeylon(RedHatTransformer transformer)(CeylonAstType node);
    shared formal CeylonAstType toCeylon(RedHatType node);
    shared formal [CodesProvider<CeylonAstType>+] tests;
    
    codes => [for (test in tests) for (code in test.codes) code];
    
    test
    shared void compilation() => testCompilation(compile, for (test in tests) for (code in test.codes) code);
    test
    shared void conversion() => testConversion(fromCeylon, toCeylon, for (test in tests) for (code in test.codes) code.item);
}
