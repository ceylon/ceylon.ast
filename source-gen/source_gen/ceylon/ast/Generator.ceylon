import ceylon.file {
    parsePath,
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
            if (!done) {
                process.writeErrorLine(
                    "Warning! Couldn’t find a place to insert
                     '
                     ``head````customTail``
                     '
                     into ``filename``");
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
