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
