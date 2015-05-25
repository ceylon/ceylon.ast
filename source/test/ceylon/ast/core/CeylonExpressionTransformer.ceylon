import ceylon.test {
    test,
    assertEquals
}
import ceylon.file {
    File,
    parsePath
}
import ceylon.ast.core {
    CeylonExpressionTransformer
}
import ceylon.ast.samples.completeCompilationUnit {
    completeCompilationUnit
}

"Tests that [[CeylonExpressionTransformer]] returns a valid expression."
native
test
shared void testCeylonExpressionTransformer();

native ("js")
test
shared void testCeylonExpressionTransformer() {
    // weak test: test only that it doesn’t crash
    completeCompilationUnit.transform(CeylonExpressionTransformer());
    // TODO: should eventually be possible on JS backend as well;
    // see ceylon/ceylon-sdk#239
}

native ("jvm")
test
shared void testCeylonExpressionTransformer() {
    assert (is File completeCUFile = parsePath("source/ceylon/ast/samples/completeCompilationUnit/completeCompilationUnit.ceylon").resource);
    String completeCUCode;
    try (r = completeCUFile.Reader("UTF-8")) {
        StringBuilder completeCUCodeSb = StringBuilder();
        /*
         Structure:
         
             bla bla bla
             /* BEGIN */ code
             code code /* END */ bla
             bla bla
         */
        while (exists l = r.readLine()) {
            if (exists i = l.firstInclusion("/* BEGIN */")) {
                completeCUCodeSb.append(l[(i + "/* BEGIN */".size)...]);
                completeCUCodeSb.appendNewline();
                break;
            }
        }
        while (exists l = r.readLine()) {
            if (exists i = l.firstInclusion("/* END */")) {
                completeCUCodeSb.append(l[... i - 1]);
                break;
            } else {
                completeCUCodeSb.append(l);
                completeCUCodeSb.appendNewline();
            }
        }
        completeCUCode = completeCUCodeSb.string.trimmed;
    }
    
    assertEquals {
        expected = completeCUCode;
        actual = completeCompilationUnit.transform(CeylonExpressionTransformer());
    };
}
