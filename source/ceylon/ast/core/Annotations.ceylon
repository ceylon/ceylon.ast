"""A list of annotations.
   
   The first annotation may optionally be an [[anonymous annotation|anonymousAnnotation]],
   that is, a [[string literal|StringLiteral]] interpreted as the argument of a [[doc]] annotation.
   
   Annotations are not separated by any punctuation.
   
   Examples:
   
       shared formal
       "The number of elements in this list" see (`value List.lastIndex`) shared actual"""
shared class Annotations(anonymousAnnotation = null, annotations = [])
        extends Node() {
    
    "The anonymous [[doc]] annotation, if present."
    shared StringLiteral? anonymousAnnotation;
    "The regular annotations."
    shared Annotation[] annotations;
    
    shared actual Annotation[]|[StringLiteral, Annotation*] children;
    if (exists anonymousAnnotation) {
        children = [anonymousAnnotation, *annotations];
    } else {
        children = annotations;
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAnnotations(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitAnnotations(this);

    shared actual Boolean equals(Object that) {
        if (is Annotations that) {
            if (exists anonymousAnnotation) {
                if (exists anonymousAnnotation_ = that.anonymousAnnotation) {
                    if (anonymousAnnotation != anonymousAnnotation_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.anonymousAnnotation exists) {
                return false;
            }
            return annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * ((anonymousAnnotation?.hash else 0) + 31 * annotations.hash);
    
    shared Annotations copy(StringLiteral? anonymousAnnotation = this.anonymousAnnotation, Annotation[] annotations = this.annotations) {
        value ret = Annotations(anonymousAnnotation, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
