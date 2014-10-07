import ceylon.ast.core {
    Annotation,
    Annotations,
    StringLiteral
}

"""Converts a [[string (or literal)|doc]] and a [[stream of annotation
   names (or annotations)|annotations]] to [[Annotations]].
   
   Usage examples:
   
       annotations { "shared", "actual" }
       annotations {
           doc = "Determines if the stream is empty, that is to say, if 
                  the iterator returns no elements.";
           "shared", "default"
       }"""
shared Annotations annotations(StringLiteral|String? doc = null, {Annotation|IdentifierIsh*} annotations = {}) {
    return Annotations {
        value anonymousAnnotation {
            switch (doc)
            case (is StringLiteral?) { return doc; }
            case (is String) { return StringLiteral(doc); }
        }
        annotations = annotations.collect {
            Annotation collecting(Annotation|IdentifierIsh element) {
                switch (element)
                case (is Annotation) { return element; }
                case (is IdentifierIsh) { return Annotation(lidentifier(element)); }
            }
        };
    };
}
