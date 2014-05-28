import ceylon.ast.api {
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node
}
import ceylon.ast.redhat {
    TokenFactory
}
import ceylon.test {
    assertEquals
}

void testConversion<CeylonAstType,RedHatType>(RedHatType fromCeylon(CeylonAstType node, TokenFactory tokens), CeylonAstType toCeylon(RedHatType node), CeylonAstType+ nodes)
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    for (node in nodes) {
        assertEquals(toCeylon(fromCeylon(node, SimpleTokenFactory())), node, "Double parse of ``node``");
    }
}

void testCompilation<CeylonAstType>(CeylonAstType? compile(String code), <String->CeylonAstType>+ codes)
        given CeylonAstType satisfies Node {
    for (code->node in codes) {
        assert (exists compiled = compile(code));
        assertEquals(compiled, node, "Compile '``code``' to '``node``'");
    }
}
