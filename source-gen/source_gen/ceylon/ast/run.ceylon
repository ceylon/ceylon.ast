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

<String->String>[] parseParams(String[] arguments) {
    variable Integer i = 0;
    MutableList<String->String> params = ArrayList<String->String>();
    while (i < arguments.size) {
        assert (exists paramType = arguments[i++]);
        assert (exists paramName = arguments[i++]);
        params.add(paramType->paramName);
    }
    return params.sequence();
}

ConcreteClassGenerator makeConcreteClassGenerator(String[] arguments) {
    assert (exists type = arguments[0], exists superType = arguments[1]);
    return ConcreteClassGenerator(type, superType, parseParams(arguments[2...]), readDoc());
}

AliasGenerator makeAliasGenerator(String[] arguments) {
    assert (exists type = arguments[0], nonempty cases = arguments[1...]);
    return AliasGenerator(type, cases, readDoc());
}

AbstractClassGenerator makeAbstractClassGenerator(String[] arguments) {
    assert (exists type = arguments[0], exists superType = arguments[1], exists cases = arguments[2]);
    return AbstractClassGenerator(type, superType, cases.split('|'.equals).sequence(), parseParams(arguments[3...]), readDoc());
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
        case ("--abstract") {
            generator = makeAbstractClassGenerator(process.arguments.rest);
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
