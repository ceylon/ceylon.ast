import ceylon.file {
    parsePath,
    Nil,
    File
}
import ceylon.collection {
    ArrayList
}
//                                             Type -> name
class Generator(String type, String superType, [<String->String>*] params, String documentation) {
    
    void generateClass() {
        String filename = "source/ceylon/ast/api/``type``.ceylon";
        assert (is Nil n = parsePath(filename).resource);
        File file = n.createFile();
        try (w = file.Appender()) {
            if (exists firstLine = documentation.lines.first) {
                w.write("\"");
                w.write(firstLine);
                for (line in documentation.lines.rest) {
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
                w.writeLine();
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
                w.writeLine("\n".join(makeEquals(seq).lines.collect("        ".plus)));
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
                     shared ``type`` copy(``", ".join(params.collect((String->String elem) => "``elem.key`` ``elem.item`` = this.``elem.item``"))``)
                             => ``type``(``", ".join(params.collect(Entry<String,String>.item))``);
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
    
    shared void run() {
        generateClass();
    }
}
