import ceylon.file {
    Nil,
    parsePath,
    File
}
import ceylon.collection {
    ArrayList
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
                w.write(firstLine);
                for (line in docLines.rest) {
                    w.writeLine();
                    w.write(spaces);
                    w.write(line);
                }
                w.write(quotes);
                w.writeLine();
            }
            w.writeLine(
                "shared class ``type``(``", ".join(params.collect(Entry<String,String>.item))``)
                         extends ``superType``() {
                     ");
            if (nonempty params) {
                for (paramType->paramName in params) {
                    w.writeLine(
                        "    // TODO document!
                             shared ``paramType`` ``paramName``;");
                }
                w.writeLine("    ");
            }
            w.writeLine(
                "    shared actual [``", ".join(params.collect(Entry<String,String>.key))``] children = [``", ".join(params.collect(Entry<String,String>.item))``];
                     
                     shared actual Result transform<out Result>(Transformer<Result> transformer)
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
                     ``"\n".join(makeOldEquals(seq).lines.collect("            ".plus))``
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
                         copyExtraInfoTo(ret);
                         return ret;
                     }
                 }");
        }
    }
    
    String makeOldEquals([<String->String>+] params) {
        if (params.first.key.endsWith("?")) {
            // optional type, gets tricky
            value optionalParam = params.first.item;
            String inner;
            if (nonempty rest = params.rest) {
                inner = "\n".join(makeOldEquals(rest).lines.collect("        ".plus));
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
                "import ceylon.ast.core {
                     ``",\n    ".join(sort { type, *params.collect(Entry<String,String>.key) })``
                 }
                 import ceylon.ast.redhat {
                     RedHatTransformer,
                     ``ltype``ToCeylon,
                     compile``type``
                 }
                 import com.redhat.ceylon.compiler.typechecker.tree {
                     Tree {
                         J``type``=``type``
                     }
                 }
                 
                 shared object ``ltype`` satisfies ConcreteTest<``type``,J``type``> {
                     
                     String->``type`` construct(``", ".join { for (param in params) "String->``param.key`` ``param.item``" }``)
                             => \"\`\```"\`\`TODO\`\`".join { for (param in params) "``param.item``.key" }``\`\`\"->``type``(``", ".join { for (param in params) "``param.item``.item" }``);
                     
                     shared String->``type`` todo = construct(``", ".join { for (param in params) "``initLCase(param.key)``.todo" }``);
                     
                     compile = compile``type``;
                     fromCeylon = RedHatTransformer.transform``type``;
                     toCeylon = ``ltype``ToCeylon;
                     codes = [todo];
                 }");
        }
    }
    
    void expandRedHatTransformer() {
        value filename = "source/ceylon/ast/redhat/RedHatTransformer.ceylon";
        expandRedHatTransformerImports();
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
        String editing(String type, String name) {
            if (type.endsWith("[]")) {
                return "that.``name``.collect(transform``type[... type.size - 3]``)";
            } else if (type.startsWith("[") && type.endsWith("+]")) {
                return "that.``name``.collect(transform``type[1 .. type.size - 3]``)";
            } else if (type.endsWith("?")) {
                return "nullsafeInvoke(that.``name``, transform``type[... type.size - 2]``)";
            } else {
                return "transform``type``(that.``name``)";
            }
        }
        expandFile("source/ceylon/ast/core/Editor.ceylon",
            "    shared actual default ",
            "``type`` transform``type``(``type`` that)
                         => that.copy(``", ".join { for (type->name in params) editing(type, name) }``);");
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
