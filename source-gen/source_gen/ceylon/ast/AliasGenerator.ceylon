import ceylon.file {
    Nil,
    parsePath,
    File
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
                "shared alias ``type``
                         => ``"|".join(cases)``;"
            );
        }
    }
    
    shared actual void run() {
        generateAlias();
        expandNarrowingTransformer(false);
        expandEditor();
        expandRedHatTransformer();
    }
}
