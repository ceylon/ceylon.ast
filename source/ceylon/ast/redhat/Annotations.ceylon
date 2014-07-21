import ceylon.ast.core {
    Annotations,
    StringLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnnotationList=AnnotationList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[AnnotationList|JAnnotationList]] to a `ceylon.ast` [[Annotations]]."
shared Annotations annotationsToCeylon(JAnnotationList annotations) {
    StringLiteral? anonymousAnnotation;
    if (exists sl = annotations.anonymousAnnotation?.stringLiteral) {
        anonymousAnnotation = aStringLiteralToCeylon(sl);
    } else {
        anonymousAnnotation = null;
    }
    return Annotations(anonymousAnnotation, CeylonIterable(annotations.annotations).collect(annotationToCeylon));
}

"Compiles the given [[code]] for Annotations
 into an [[Annotations]] using the Ceylon compiler
 (more specifically, the rule for `annotations`)."
shared Annotations? compileAnnotations(String code) {
    if (exists jAnnotations = createParser(code).annotations()) {
        return annotationsToCeylon(jAnnotations);
    } else {
        return null;
    }
}
