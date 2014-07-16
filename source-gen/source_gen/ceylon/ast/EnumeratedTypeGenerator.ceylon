interface EnumeratedTypeGenerator
        satisfies Generator {
    
    shared formal String[] cases;
    
    shared void expandNarrowingTransformer(Boolean actual = true)
            => expandFile("source/ceylon/ast/core/NarrowingTransformer.ceylon",
        "    shared `` actual then "actual " else "" ``default Result transform",
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
             }
             ");
}
