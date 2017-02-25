import ceylon.ast.core {
    Identifier,
    Key,
    Node,
    ScopedKey,
    Visitor
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node
}
import ceylon.ast.redhat {
    RedHatTransformer,
    SimpleTokenFactory
}
import ceylon.test {
    assertEquals,
    assertNotEquals,
    test,
    ignore
}
import ceylon.language.meta {
    type
}

Key<JNode> originalNodeKey = ScopedKey<JNode>(`module`, "originalNode");
void storeOriginalNode(JNode originalNode, Node newNode)
        => newNode.put(originalNodeKey, originalNode);
object checkOriginalNodePresence satisfies Visitor {
    shared actual void visitNode(Node node) {
        if (!node.get(originalNodeKey) exists) {
            throw AssertionError("Node ``type(node).declaration.name`` is missing original node");
        }
        node.visitChildren(this);
    }
}

void assertNodesEquals(Node actual, Node expected, String? message = null) {
    assertEquals {
        actual = actual;
        expected = expected;
        message = message;
    };
    if (is Identifier actual) {
        assert (is Identifier expected);
        assertEquals {
            actual = actual.usePrefix;
            expected = expected.usePrefix;
            message = message;
        };
    }
}

void doTest<CeylonAstType, RedHatType>(
    CeylonAstType?(String, Anything(JNode, Node)=) parse,
    RedHatType fromCeylon(RedHatTransformer transformer)(CeylonAstType node), CeylonAstType(RedHatType, Anything(JNode, Node)=) toCeylon,
    <String->CeylonAstType>+ codes)
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    testParsing(parse, *codes);
    testConversion(fromCeylon, toCeylon, *codes.collect(Entry<String,CeylonAstType>.item));
}

void testConversion<CeylonAstType, RedHatType>(RedHatType fromCeylon(RedHatTransformer transformer)(CeylonAstType node), CeylonAstType(RedHatType, Anything(JNode, Node)=) toCeylon, CeylonAstType+ nodes)
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    for (node in nodes) {
        value converted = toCeylon(fromCeylon(RedHatTransformer(SimpleTokenFactory()))(node), storeOriginalNode);
        assertNodesEquals {
            actual = converted;
            expected = node;
            message = "Double conversion";
        };
        converted.visit(checkOriginalNodePresence);
    }
}

void testParsing<CeylonAstType>(CeylonAstType?(String, Anything(JNode, Node)=) parse, <String->CeylonAstType>+ codes)
        given CeylonAstType satisfies Node {
    for (code->node in codes) {
        assert (exists parsed = parse(code, storeOriginalNode));
        assertNodesEquals {
            actual = parsed;
            expected = node;
            message = "Parse ‘``code``’";
        };
        parsed.visit(checkOriginalNodePresence);
    }
}

void testEquality<CeylonAstType>(CeylonAstType+ nodes)
        given CeylonAstType satisfies Node {
    for (i->x in nodes.indexed) {
        for (j->y in nodes.indexed) {
            if (i == j) {
                assertEquals(x, y);
            } else {
                assertNotEquals(x, y);
            }
        }
    }
}

// needed for variance – ConcreteTest’s type params
// must be invariant, but we need them 'out' for
// use in AbstractTest
shared interface CodesProvider<out CeylonAstType>
        given CeylonAstType satisfies Node {
    shared formal [<String->CeylonAstType>+] codes;
}

shared interface NodesProvider<out CeylonAstType>
        given CeylonAstType satisfies Node {
    shared formal [CeylonAstType+] nodes;
}

shared interface ParsingTest<out CeylonAstType>
        satisfies CodesProvider<CeylonAstType>
        given CeylonAstType satisfies Node {
    
    shared formal CeylonAstType? parse(String code, Anything(JNode, Node) update = noop);
    
    test
    shared void parsing() => testParsing(parse, *codes);
}

shared interface ConversionTest<CeylonAstType, RedHatType>
        satisfies NodesProvider<CeylonAstType>
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    
    shared formal RedHatType fromCeylon(RedHatTransformer transformer)(CeylonAstType node);
    shared formal CeylonAstType toCeylon(RedHatType node, Anything(JNode, Node) update = noop);
    
    test
    shared void conversion() => testConversion(fromCeylon, toCeylon, *nodes);
    
    test
    ignore ("Not useful during regular development")
    shared void equality() => testEquality(*nodes);
}

shared interface ConcreteTest<CeylonAstType, RedHatType>
        satisfies ParsingTest<CeylonAstType> & ConversionTest<CeylonAstType,RedHatType>
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    
    shared actual [CeylonAstType+] nodes => codes*.item;
}

shared interface AbstractTest<CeylonAstType, RedHatType>
        satisfies ParsingTest<CeylonAstType> & ConversionTest<CeylonAstType,RedHatType>
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    
    shared formal [CodesProvider<CeylonAstType>+] tests;
    
    shared actual [<String->CeylonAstType>+] codes => [for (test in tests) for (code in test.codes) code];
    shared actual [CeylonAstType+] nodes => codes*.item;
}

shared interface AbstractParsingTest<out CeylonAstType>
        satisfies ParsingTest<CeylonAstType>
        given CeylonAstType satisfies Node {
    
    shared formal [CodesProvider<CeylonAstType>+] tests;
    
    shared actual [<String->CeylonAstType>+] codes => [for (test in tests) for (code in test.codes) code];
}

shared interface AbstractConversionTest<CeylonAstType, RedHatType>
        satisfies ConversionTest<CeylonAstType,RedHatType>
        given CeylonAstType satisfies Node
        given RedHatType satisfies JNode {
    
    shared formal [NodesProvider<CeylonAstType>+] tests;
    
    shared actual [CeylonAstType+] nodes => [for (test in tests) for (node in test.nodes) node];
}
