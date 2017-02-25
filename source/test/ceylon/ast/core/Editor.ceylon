import ceylon.ast.core {
    Editor,
    Node,
    ScopedKey
}
import ceylon.test {
    test,
    assertEquals
}
import ceylon.ast.samples.completeCompilationUnit {
    completeCompilationUnit
}

"Tests that [[Editor]] creates an equal copy."
test
shared void testEditor() {
    value original = completeCompilationUnit;
    value copy = original.transform {
        object transformer satisfies Editor {}
    };
    assertEquals {
        actual = copy;
        expected = original;
        message = "Editor copy";
    };
}

"Tests that an [[Editor]] with `editNode` that always returns [[false]] does not create a copy."
test
shared void testUneditor() {
    void testNode(Node node) {
        object uneditor satisfies Editor {
            shared actual Boolean editNode(Node that) => false;
        }
        value original = node;
        value copy = original.transform(uneditor);
        value key = ScopedKey<Boolean>(`function testUneditor`, "identity");
        original.set(key, true);
        try {
            "copy must be identical and share original's extra info"
            assert (copy.getObject(key) exists);
        } finally {
            original.delete(key);
        }
        for (child in node.children) {
            testNode(child);
        }
    }
    testNode(completeCompilationUnit);
}
