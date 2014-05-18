import ceylon.test {
    test,
    assertEquals
}
import ceylon.ast.api {
    Node,
    Visitor
}

test
void nodeCeylonExpression() {
    class MyNode() extends Node([]) {
        
        shared variable Integer accessCounter = 0;
        
        toCeylonExpression() => "`` ++accessCounter ``";
        
        equals(Object other) => true;
        hash = 1;
        visit(Visitor visitor) => visitor.visitNode(this);
    }
    value node = MyNode();
    assertEquals(node.ceylonExpression, "1", "toCeylonExpression() called");
    assertEquals(node.ceylonExpression, "1", "toCeylonExpression() not called again");
    assertEquals(node.ceylonExpression, "1", "toCeylonExpression() not called again, again");
    assertEquals(node.accessCounter, 1, "toCeylonExpression was not called again");
    assertEquals(node.toCeylonExpression(), "2", "toCeylonExpression() works");
    assertEquals(node.ceylonExpression, "1", "ceylonExpression cached");
    assertEquals(node.accessCounter, 2, "toCeylonExpression() worked");
}
