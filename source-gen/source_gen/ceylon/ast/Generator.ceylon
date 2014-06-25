import ceylon.file {
    parsePath,
    Nil,
    File
}
import ceylon.collection {
    ArrayList
}

interface Generator {
    
    shared formal void run();
    
    shared formal String type;
    
    shared void expandFile(String filename, String head, String customTail) {
        
        value newLine = head + customTail;
        
        assert (is File file = parsePath(filename).resource);
        value l = ArrayList<String>();
        try (r = file.Reader("UTF-8")) {
            "If the tail was already inserted."
            variable Boolean done = false;
            while (exists line = r.readLine()) {
                if (!done,
                    line.startsWith(head),
                    newLine < line) {
                    done = true;
                    l.add(newLine);
                }
                l.add(line);
            }
        }
        try (w = file.Overwriter("UTF-8")) {
            for (line in l) {
                w.writeLine(line);
            }
        }
    }
    
    shared void expandTransformer()
            => expandFile(
        "source/ceylon/ast/core/Transformer.ceylon",
        "    shared formal Result transform", "``type``(``type`` that);");
}

interface ClassGenerator
        satisfies Generator {
    
    shared formal String superType;
    
    shared void expandWideningTransformer()
            => expandFile(
        "source/ceylon/ast/core/WideningTransformer.ceylon",
        "    shared actual default Result transform",
        "``type``(``type`` that) => transform``superType``(that);");
    
    shared void expandVisitor() {
        value filename = "source/ceylon/ast/core/Visitor.ceylon";
        expandFile(filename,
            "    transform",
            "``type``(``type`` that) => visit``type``(that);");
        expandFile(filename,
            "    shared default void visit",
            "``type``(``type`` that) => super.transform``type``(that);");
    }
}

interface EnumeratedTypeGenerator
        satisfies Generator {
    
    shared formal String[] cases;
    
    shared void expandNarrowingTransformer()
            => expandFile("source/ceylon/ast/core/NarrowingTransformer.ceylon",
        "    shared actual default Result transform",
        "``type``(``type`` that) {
                 switch (that)
         ``"\n".join { for (caseType in cases) "        case (is ``caseType``) { return transform``caseType``(that); }" }``
             }");
    
    shared void expandEditor()
            => expandFile("source/ceylon/ast/core/Editor.ceylon",
        "    shared actual default ",
        "``type`` transform``type``(``type`` that) {
                 assert (is ``type`` ret = super.transform``type``(that));
                 return ret;
             }");
    
    shared void expandRedHatTransformer()
            => expandFile("source/ceylon/ast/redhat/RedHatTransformer.ceylon",
        "    shared actual J",
        "``type`` transform``type``(``type`` that) {
                 assert (is J``type`` ret = super.transform``type``(that));
                 return ret;
             }");
}

class ConcreteClassGenerator(
    shared actual String type,
    shared actual String superType,
    "Type->name"
    [<String->String>*] params,
    String documentation)
        satisfies ClassGenerator {
    
    assert (exists firstChar = type.first);
    value ltype = String { firstChar.lowercased, *type.rest };
    variable value splitType = type;
    for (char in 'A'..'Z') {
        splitType = splitType.replace(String { char }, String { ' ', char });
    }
    splitType = splitType[1...];
    
    value aAn = firstChar in "aeiouAEIOU" then "an" else "a";
    
    value docLines = documentation.trimTrailing('\n'.equals).split { '\n'.equals; groupSeparators = false; };
    
    void generateClass() {
        String filename = "source/ceylon/ast/core/``type``.ceylon";
        assert (is Nil n = parsePath(filename).resource);
        File file = n.createFile();
        try (w = file.Appender("UTF-8")) {
            if (exists firstLine = docLines.first) {
                w.write("\"");
                w.write(firstLine);
                for (line in docLines.rest) {
                    w.writeLine();
                    w.write(" ");
                    w.write(line);
                }
                w.write("\"");
                w.writeLine();
            }
            w.writeLine(
                "shared class ``type``(``", ".join(params.collect(Entry<String,String>.item))``)
                         extends ``superType``([``", ".join(params.collect(Entry<String,String>.item))``]) {
                     ");
            for (paramType->paramName in params) {
                w.writeLine(
                    "    // TODO document!
                         shared ``paramType`` ``paramName``;");
            }
            if (nonempty params) {
                w.writeLine("    ");
            }
            w.writeLine(
                "    shared actual Result transform<out Result>(Transformer<Result> transformer)
                             => transformer.transform``type``(this);
                     
                     shared actual Boolean equals(Object that) {");
            if (nonempty params) {
                value optionalParams = params.select((String->String elem) => elem.key.endsWith("?"));
                value nonOptionalParams = params.select((String->String elem) => !elem.key.endsWith("?"));
                value sortedParams = ArrayList { elements = optionalParams; };
                sortedParams.addAll(nonOptionalParams);
                assert (nonempty seq = sortedParams.sequence());
                w.writeLine(
                    "        if (is ``type`` that) {
                     ``"\n".join(makeEquals(seq).lines.collect("            ".plus))``
                             } else {
                                 return false;
                             }");
            } else {
                w.writeLine("        return that is ``type``;");
            }
            w.writeLine(
                "    }
                     ");
            if (nonempty params) {
                w.writeLine(
                    "    shared actual Integer hash
                                 => ``makeHash(params)``;");
            } else {
                w.writeLine(
                    "    shared actual Integer hash = ``type.hash``;");
            }
            w.writeLine(
                "    
                     shared ``type`` copy(``", ".join(params.collect((String->String elem) => "``elem.key`` ``elem.item`` = this.``elem.item``"))``) {
                         value ret = ``type``(``", ".join(params.collect(Entry<String,String>.item))``);
                         ret.extraInfo = extraInfo;
                         return ret;
                     }
                 }");
        }
    }
    
    String makeEquals([<String->String>+] params) {
        if (params.first.key.endsWith("?")) {
            // optional type, gets tricky
            value optionalParam = params.first.item;
            String inner;
            if (nonempty rest = params.rest) {
                inner = "\n".join(makeEquals(rest).lines.collect("        ".plus));
            } else {
                inner = "        return true;";
            }
            return "if (exists ``optionalParam``) {
                        if (exists ``optionalParam``_ = that.``optionalParam``) {
                    ``inner.replaceFirst("return ", "return ``optionalParam`` == ``optionalParam``_ && ")``
                        } else {
                            return false;
                        }
                    } else {
                        if (!(that.``optionalParam`` exists)) {
                    ``inner``
                        } else {
                            return false;
                        }
                    }";
        } else {
            // no more optional types
            return "return " + " && ".join { for (param in params) "``param.item`` == that.``param.item``" } + ";";
        }
    }
    
    String makeHash([<String->String>+] params) {
        value ownHash = params.first.key.endsWith("?") then "(``params.first.item``?.hash else 0)" else "``params.first.item``.hash";
        if (nonempty rest = params.rest) {
            return "31 * (``ownHash`` + ``makeHash(rest)``)";
        } else {
            return "31 * ``ownHash``";
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
                 import com.redhat.ceylon.compiler.typechecker.tree {
                     Tree {
                         J``type``=``type``
                     }
                 }
                 import ceylon.ast.redhat {
                     createParser
                 }
                 
                 \"Converts a RedHat AST [[``type``|J``type``]] to a `ceylon.ast` [[``type``]].\"
                 shared ``type`` ``ltype``ToCeylon(J``type`` ``ltype``) {
                     return ``type``(TODO);
                 }
                 
                 \"Compiles the given [[code]] for ``aAn`` ``splitType``
                  into ``aAn`` [[``type``]] using the Ceylon compiler
                  (more specifically, the rule for ``aAn`` \```ltype``\`).\"
                 shared ``type``? compile``type``(String code) {
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
                "import ceylon.test {
                     test
                 }
                 import ceylon.ast.core {
                     ``type``
                 }
                 import ceylon.ast.redhat {
                     RedHatTransformer,
                     ``ltype``ToCeylon,
                     compile=compile``type``
                 }
                 
                 test
                 shared void ``ltype``()
                         => doTest(compile, RedHatTransformer.transform``type``, ``ltype``ToCeylon,
                     // TODO add sample(s)
                 );");
        }
    }
    
    void expandRedHatTransformer() {
        value filename = "source/ceylon/ast/redhat/RedHatTransformer.ceylon";
        expandFile(filename,
            "        J",
            "``type``=``type``,");
        expandFile(filename,
            "    shared actual J",
            "``type`` transform``type``(``type`` that) {
                     J``type`` ret = J``type``(null);
                     ret.TODO = transformTODO(that.TODO);
                     return ret;
                 }
                 ");
    }
    
    void expandEditor() {
        expandFile("source/ceylon/ast/core/Editor.ceylon",
            "    shared actual default ",
            "``type`` transform``type``(``type`` that)
                         => that.copy();");
    }
    
    void expandCeylonExpressionTransformer() {
        if (params.longerThan(1)) {
            // generate multi-line named args
            expandFile("source/ceylon/ast/core/CeylonExpressionTransformer.ceylon",
                "    transform",
                "``type``(``type`` that)
                             => \"``type`` {
                 ``"\n".join { for (param in params.collect(Entry<String,String>.item)) "                \`\` indent + indentLevel \`\```param`` = \`\`transformWithIndent(that.``param``)\`\`;" }``
                                 \`\`indent\`\`}\";");
        } else if (exists first = params.first) {
            // generate inline positional args
            expandFile("source/ceylon/ast/core/CeylonExpressionTransformer.ceylon",
                "    transform",
                "``type``(``type`` that) => \"``type``(\`\`transformWithIndent(that.``first.item``)\`\`)\";");
        } else {
            expandFile("source/ceylon/ast/core/CeylonExpressionTransformer.ceylon",
                "    transform",
                "``type``(``type`` that) => \"``type``()\";");
        }
    }
    
    shared actual void run() {
        generateClass();
        generateBackend();
        generateBackendTest();
        expandTransformer();
        expandWideningTransformer();
        expandVisitor();
        expandRedHatTransformer();
        expandEditor();
        expandCeylonExpressionTransformer();
    }
}

class AliasGenerator(shared actual String type, shared actual String[] cases, String documentation)
        satisfies EnumeratedTypeGenerator {
    
    value docLines = documentation.trimTrailing('\n'.equals).split { '\n'.equals; groupSeparators = false; };
    
    void generateAlias() {
        String filename = "source/ceylon/ast/core/``type``.ceylon";
        assert (is Nil n = parsePath(filename).resource);
        File file = n.createFile();
        try (w = file.Appender("UTF-8")) {
            if (exists firstLine = docLines.first) {
                w.write("\"");
                w.write(firstLine);
                for (line in docLines.rest) {
                    w.writeLine();
                    w.write(" ");
                    w.write(line);
                }
                w.write("\"");
                w.writeLine();
            }
            w.writeLine(
                "shared alias ``type``
                         => ``"|".join(cases)``;"
            );
        }
    }
    
    shared actual void run() {
        generateAlias();
        expandNarrowingTransformer();
        expandEditor();
        expandRedHatTransformer();
    }
}

class AbstractClassGenerator(shared actual String type, shared actual String superType, shared actual String[] cases, <String->String>[] params, String documentation)
        satisfies ClassGenerator&EnumeratedTypeGenerator {
    
    value docLines = documentation.trimTrailing('\n'.equals).split { '\n'.equals; groupSeparators = false; };
    
    void generateAbstractClass() {
        String filename = "source/ceylon/ast/core/``type``.ceylon";
        assert (is Nil n = parsePath(filename).resource);
        File file = n.createFile();
        try (w = file.Appender("UTF-8")) {
            if (exists firstLine = docLines.first) {
                w.write("\"");
                w.write(firstLine);
                for (line in docLines.rest) {
                    w.writeLine();
                    w.write(" ");
                    w.write(line);
                }
                w.write("\"");
                w.writeLine();
            }
            w.writeLine(
                "shared abstract class ``type``(``", ".join(params.collect(Entry<String,String>.item))``)
                         of ``"|".join(cases)``
                         extends ``superType``([``", ".join(params.collect(Entry<String,String>.item))``]) {
                     ");
            for (paramType->paramName in params) {
                w.writeLine(
                    "    // TODO document!
                         shared ``paramType`` ``paramName``;");
            }
            w.writeLine("}");
        }
    }
    
    shared actual void run() {
        generateAbstractClass();
        expandTransformer();
        expandNarrowingTransformer();
        expandEditor();
        expandWideningTransformer();
        expandVisitor();
        expandRedHatTransformer();
    }
}
