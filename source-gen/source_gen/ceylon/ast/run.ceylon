import ceylon.collection {
    MutableList,
    ArrayList
}

String readDoc() {
    variable String? line = process.readLine();
    StringBuilder doc = StringBuilder();
    while (exists l = line) {
        doc.append(l);
        doc.appendNewline();
        line = process.readLine();
    }
    return doc.string;
}

ConcreteClassGenerator makeConcreteClassGenerator(String[] arguments) {
    assert (exists type = arguments[0], exists superType = arguments[1]);
    variable Integer i = 2;
    MutableList<String->String> params = ArrayList<String->String>();
    while (i < arguments.size) {
        assert (exists paramType = arguments[i++]);
        assert (exists paramName = arguments[i++]);
        params.add(paramType->paramName);
    }
    return ConcreteClassGenerator(type, superType, params.sequence(), readDoc());
}

AliasGenerator makeAliasGenerator(String[] arguments) {
    assert (exists type = arguments[0], exists cases = arguments[1]);
    return AliasGenerator(type, cases.split('|'.equals).sequence(), readDoc());
}

"Run the module `source_gen.ceylon.ast`.
 
 See [this gist](https://gist.github.com/lucaswerkmeister/a4da0fa5d9d5b14cc3e9)."
shared void run() {
    if (exists first = process.arguments.first) {
        Generator generator;
        switch (first)
        case ("--help") {
            print("https://gist.github.com/lucaswerkmeister/a4da0fa5d9d5b14cc3e9");
            return;
        }
        case ("--alias") {
            generator = makeAliasGenerator(process.arguments.rest);
        }
        else {
            generator = makeConcreteClassGenerator(process.arguments);
        }
        generator.run();
    } else {
        print("No arguments!");
        return;
    }
}
