import ceylon.ast.core {
    Editor,
    Visitor,
    Node,
    ScopedKey
}
import ceylon.test {
    test,
    assertEquals,
    assertFalse
}
import ceylon.ast.samples.completeCompilationUnit {
    completeCompilationUnit
}

"Tests that [[Editor]]
 - creates an equal copy, but
 - always creates a copy
 
 testing the latter by attaching additional information
 afterwards to the original and then asserting that
 it doesn’t pop up anywhere in the copy."
test
shared void testEditor() {
    
    value original = completeCompilationUnit;
    value copy = original.transform {
        object transformer satisfies Editor {}
    };
    assertEquals {
        actual = copy;
        expected = original;
        message = "Editor copy";
    };
    
    value key = ScopedKey<Integer>(`function testEditor`, "id");
    variable Integer i = 0;
    original.visit {
        object visitor satisfies Visitor {
            shared actual void visitNode(Node that) {
                that.put(key, i++);
                super.visitNode(that);
            }
        }
    };
    try {
        copy.visit {
            object visitor satisfies Visitor {
                shared actual void visitNode(Node that) {
                    assertFalse(that.get(key) exists, "Node must be a copy");
                    super.visitNode(that);
                }
            }
        };
    } finally {
        // remove id again
        original.visit {
            object visitor satisfies Visitor {
                shared actual void visitNode(Node that) {
                    that.remove(key);
                    super.visitNode(that);
                }
            }
        };
    }
}
