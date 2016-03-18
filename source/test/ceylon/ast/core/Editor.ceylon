import ceylon.ast.core {
    Editor
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
