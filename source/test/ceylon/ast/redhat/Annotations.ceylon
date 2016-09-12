import ceylon.ast.core {
    Annotation,
    Annotations,
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    annotationsToCeylon,
    parseAnnotations
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnnotationList=AnnotationList
    }
}

shared object annotations satisfies ConcreteTest<Annotations,JAnnotationList> {
    
    String->Annotations construct(<String->StringLiteral>? anonymousAnnotation = null, <String->Annotation>[] annotations = [])
            => "`` anonymousAnnotation?.key else "" `` ``" ".join(annotations*.key)``"->Annotations(anonymousAnnotation?.item, annotations*.item);
    
    shared String->Annotations emptyAnnotations = construct();
    shared String->Annotations helloSharedByLucasAnnotations = construct(stringLiteral.helloStringLiteral, [annotation.sharedAnnotation, annotation.byLucasAnnotation]);
    
    // not tested directly, but used by other tests
    shared String->Annotations sharedAnnotations = construct(null, [annotation.sharedAnnotation]);
    shared String->Annotations sharedActualAnnotations = construct(null, [annotation.sharedAnnotation, annotation.actualAnnotation]);
    
    parse = parseAnnotations;
    fromCeylon = RedHatTransformer.transformAnnotations;
    toCeylon = annotationsToCeylon;
    codes = [emptyAnnotations, helloSharedByLucasAnnotations];
}
