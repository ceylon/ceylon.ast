import ceylon.file {
    Nil,
    parsePath,
    File
}

class AbstractClassGenerator(shared actual String type, shared actual String superType, shared actual String[] cases, <String->String>[] params, String documentation)
        satisfies ClassGenerator & EnumeratedTypeGenerator {
    
    value docLines = documentation.trimTrailing('\n'.equals).split { '\n'.equals; groupSeparators = false; };
    
    assert (exists firstChar = type.first);
    value aAn = firstChar in "aeiouAEIOU" then "an" else "a";
    value ltype = initLCase(type);
    
    variable value splitType = type;
    for (char in 'A'..'Z') {
        splitType = splitType.replace(String { char }, String { ' ', char });
    }
    splitType = splitType[1...];
    
    void generateAbstractClass() {
        String filename = "source/ceylon/ast/core/``type``.ceylon";
        assert (is Nil n = parsePath(filename).resource);
        File file = n.createFile();
        try (w = file.Appender("UTF-8")) {
            if (!docLines.first.empty) {
                String quotes;
                String spaces;
                if (documentation.contains('"') || documentation.contains("""``""")) {
                    quotes = "\"\"\"";
                    spaces = "   ";
                } else {
                    quotes = "\"";
                    spaces = " ";
                }
                w.write(quotes);
                w.write(docLines.first);
                for (line in docLines.rest) {
                    w.writeLine();
                    w.write(spaces);
                    w.write(line);
                }
                w.write(quotes);
                w.writeLine();
            }
            w.writeLine(
                "shared abstract class ``type``()
                         of ``" | ".join(cases)``
                         extends ``superType``() {");
            if (params nonempty) {
                w.writeLine("    ");
                for (paramType->paramName in params) {
                    w.writeLine(
                        "    // TODO document!
                             shared formal ``paramType`` ``paramName``;");
                }
                w.writeLine("    ");
                w.writeLine("    shared actual formal [``", ".join(params.collect(Entry<String,String>.key))``] children;");
            }
            w.writeLine("}");
        }
    }
    
    void generateBackend() {
        String filename = "source/ceylon/ast/redhat/``type``.ceylon";
        assert (is Nil n = parsePath(filename).resource);
        File file = n.createFile();
        try (w = file.Appender("UTF-8")) {
            w.writeLine(
                "import ceylon.ast.core {
                     ``type``
                 }
                 import org.eclipse.ceylon.compiler.typechecker.tree {
                     Tree {
                         ``",\n        ".join(sort({ for (klass in { type, *cases }) "J``klass``=``klass``" }))``
                     }
                 }
                 
                 \"Converts a RedHat AST [[``type``|J``type``]] to a `ceylon.ast` [[``type``]].\"
                 shared ``type`` ``ltype``ToCeylon(J``type`` ``ltype``) {
                     assert (is ``"|".join(cases.map("J".plus))`` ``ltype``);
                     switch (``ltype``)
                     ``"\n    ".join({ for (kase in cases) "case (is J``kase``) { return ``initLCase(kase)``ToCeylon(``ltype``); }" })``
                 }
                 
                 \"Parses the given [[code]] for ``aAn`` ``splitType``
                  into ``aAn`` [[``type``]] using the Ceylon compiler
                  (more specifically, the rule for ``aAn`` \```ltype``\`).\"
                 shared ``type``? parse``type``(String code) {
                     if (exists j``type`` = createParser(code).``ltype``()) {
                         return ``ltype``ToCeylon(j``type``);
                     } else {
                         return null;
                     }
                 }");
        }
    }
    
    void generateBackendTest() {
        String filename = "source/test/ceylon/ast/redhat/``type``.ceylon";
        assert (is Nil n = parsePath(filename).resource);
        File file = n.createFile();
        try (w = file.Appender("UTF-8")) {
            w.writeLine(
                "import ceylon.ast.core {
                     ``type``
                 }
                 import ceylon.ast.redhat {
                     RedHatTransformer,
                     ``ltype``ToCeylon,
                     parse``type``
                 }
                 import org.eclipse.ceylon.compiler.typechecker.tree {
                     Tree {
                         J``type``=``type``
                     }
                 }
                 
                 shared object ``ltype`` satisfies AbstractTest<``type``,J``type``> {
                     parse = parse``type``;
                     fromCeylon = RedHatTransformer.transform``type``;
                     toCeylon = ``ltype``ToCeylon;
                     
                     tests = [``", ".join { for (cas in cases) initLCase(cas) }``];
                 }");
        }
    }
    
    shared actual void run() {
        generateAbstractClass();
        generateBackend();
        generateBackendTest();
        expandTransformer();
        expandCascadingNarrowingTransformer();
        expandImmediateNarrowingTransformer();
        expandEditor();
        expandWideningTransformer();
        expandVisitor();
        expandRedHatTransformerImports();
        expandRedHatTransformer();
    }
}
