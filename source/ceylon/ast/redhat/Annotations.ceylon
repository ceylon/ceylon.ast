import ceylon.ast.core {
    Annotations,
    Node,
    StringLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAnnotationList=AnnotationList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[AnnotationList|JAnnotationList]] to a `ceylon.ast` [[Annotations]]."
shared Annotations annotationsToCeylon(JAnnotationList annotations, Anything(JNode, Node) update = noop) {
    StringLiteral? anonymousAnnotation;
    if (exists sl = annotations.anonymousAnnotation?.stringLiteral) {
        anonymousAnnotation = aStringLiteralToCeylon(sl, update);
    } else {
        anonymousAnnotation = null;
    }
    value result = Annotations(anonymousAnnotation, CeylonIterable(annotations.annotations).collect(propagateUpdate(annotationToCeylon, update)));
    update(annotations, result);
    return result;
}

"Parses the given [[code]] for Annotations
 into an [[Annotations]] using the Ceylon compiler
 (more specifically, the rule for `annotations`)."
shared Annotations? parseAnnotations(String code, Anything(JNode, Node) update = noop) {
    if (exists jAnnotations = createParser(code).annotations()) {
        return annotationsToCeylon(jAnnotations, update);
    } else {
        return null;
    }
}
