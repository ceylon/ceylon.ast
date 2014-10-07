import ceylon.ast.core {
    Annotation,
    Annotations,
    LIdentifier,
    StringLiteral
}
import ceylon.ast.create {
    createAnnotations=annotations
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void annotations() {
    assertEquals {
        actual = createAnnotations();
        expected = Annotations();
        message = "Empty annotations";
    };
    assertEquals {
        actual = createAnnotations("Doc");
        expected = Annotations(StringLiteral("Doc"));
        message = "Doc annotations";
    };
    assertEquals {
        actual = createAnnotations { "shared", "actual" };
        expected = Annotations(null, [Annotation(LIdentifier("shared")), Annotation(LIdentifier("actual"))]);
        message = "shared actual annotations";
    };
    assertEquals {
        actual = createAnnotations {
            doc = "Doc";
            "shared", "actual"
        };
        expected = Annotations {
            anonymousAnnotation = StringLiteral("Doc");
            annotations = [
                Annotation(LIdentifier("shared")),
                Annotation(LIdentifier("actual"))
            ];
        };
        message = "Doc shared actual annotations";
    };
}
