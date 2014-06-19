import ceylon.collection {
    MutableList,
    ArrayList
}
"Run the module `source_gen.ceylon.ast`.
 
 See [this gist](https://gist.github.com/lucaswerkmeister/a4da0fa5d9d5b14cc3e9)."
shared void run() {
    if (exists first = process.arguments.first, first == "--help") {
        print("https://gist.github.com/lucaswerkmeister/a4da0fa5d9d5b14cc3e9");
        return;
    }
    assert (exists type = process.arguments[0], exists superType = process.arguments[1]);
    variable Integer i = 2;
    MutableList<String->String> params = ArrayList<String->String>();
    while (i < process.arguments.size) {
        assert (exists paramType = process.arguments[i++]);
        assert (exists paramName = process.arguments[i++]);
        params.add(paramType->paramName);
    }
    variable String? line = process.readLine();
    StringBuilder doc = StringBuilder();
    while (exists l = line) {
        doc.append(l);
        doc.appendNewline();
        line = process.readLine();
    }
    Generator(type, superType, params.sequence(), doc.string).run();
}
