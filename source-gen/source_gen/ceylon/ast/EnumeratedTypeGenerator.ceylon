interface EnumeratedTypeGenerator
        satisfies Generator {
    
    shared formal String[] cases;
    
    shared void expandCascadingNarrowingTransformer()
            => expandFile("source/ceylon/ast/core/CascadingNarrowingTransformer.ceylon",
        "    shared actual default Result transform",
        "``type``(``type`` that) {
                 switch (that)
         ``"\n".join { for (caseType in cases) "        case (is ``caseType``) { return transform``caseType``(that); }" }``
             }");
    
    shared void expandImmediateNarrowingTransformer()
            => expandFile("source/ceylon/ast/core/ImmediateNarrowingTransformer.ceylon",
        "    shared actual default Result transform",
        "``type``(``type`` that)
                     => that.transform(this);");
    
    shared void expandEditor()
            => expandFile("source/ceylon/ast/core/Editor.ceylon",
        "    shared actual ",
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
