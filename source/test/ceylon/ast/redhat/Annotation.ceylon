import ceylon.ast.core {
    Annotation,
    Arguments,
    LIdentifier,
    helper=annotation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    annotationToCeylon,
    compileAnnotation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnnotation=Annotation
    }
}
import ceylon.test {
    test,
    assertEquals
}

shared object annotation satisfies ConcreteTest<Annotation,JAnnotation> {
    
    String->Annotation construct(String->LIdentifier name, <String->Arguments>? arguments)
            => "``name.key```` arguments?.key else "" ``"->Annotation(name.item, arguments?.item);
    
    shared String->Annotation sharedAnnotation = construct(identifier.sharedLIdentifier, null);
    shared String->Annotation byLucasAnnotation = construct(identifier.byLIdentifier, positionalArguments.lucasPositionalArguments);
    
    // not tested directly, but used by other tests
    shared String->Annotation actualAnnotation = construct(identifier.actualLIdentifier, null);
    
    test
    shared void testHelper() {
        assertEquals(helper("shared"), sharedAnnotation.item);
    }
    
    compile = compileAnnotation;
    fromCeylon = RedHatTransformer.transformAnnotation;
    toCeylon = annotationToCeylon;
    codes = [sharedAnnotation, byLucasAnnotation];
}
