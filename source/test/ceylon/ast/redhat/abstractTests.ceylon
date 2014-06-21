import ceylon.ast.api {
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node
}
import ceylon.ast.redhat {
    RedHatTransformer
}
import ceylon.test {
    assertEquals
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
        assertEquals(toCeylon(fromCeylon(RedHatTransformer(SimpleTokenFactory()))(node)), node, "Double parse of ``node``");
    }
}

void testCompilation<CeylonAstType>(CeylonAstType? compile(String code), <String->CeylonAstType>+ codes)
        given CeylonAstType satisfies Node {
    for (code->node in codes) {
        assert (exists compiled = compile(code));
        assertEquals(compiled, node, "Compile '``code``' to '``node``'");
    }
}
