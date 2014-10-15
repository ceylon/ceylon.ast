import ceylon.ast.core {
    Key,
    BaseExpression,
    LIdentifier,
    MemberNameWithTypeArguments
}
import ceylon.ast.samples.removeExtraInfoVisitor {
    RemoveExtraInfoVisitor
}
import ceylon.test {
    test,
    beforeTest,
    assertFalse,
    assertTrue
}

class A() {}
class AA() extends A() {}
class AB() extends A() {}
class AAA() extends AA() {}
class AAB() extends AA() {}
class ABA() extends AB() {}
class B() {}
class BA() extends B() {}

shared class RemoveExtraInfoVisitorTest() {
    
    value innerNode = LIdentifier("node");
    value outerNode = BaseExpression(MemberNameWithTypeArguments(innerNode));
    value nodes = [innerNode, outerNode];
    
    value kA = Key<A>("A");
    value kAA = Key<AA>("AA");
    value kAAA = Key<AAA>("AAA");
    value kAAB = Key<AAB>("AAB");
    value kAB = Key<AB>("AB");
    value kABA = Key<ABA>("ABA");
    value kB = Key<B>("B");
    value kBA = Key<BA>("BA");
    
    [Key<out AA>+] keysAA = [kAA, kAAA, kAAB];
    [Key<out AB>+] keysAB = [kAB, kABA];
    [Key<out A>+] keysA = [kA, kAA, kAAA, kAAB, kAB, kABA]; // TODO when ceylon.language#573 is fixed: [kA, *concatenate(keysAA, keysAB)];
    [Key<out B>+] keysB = [kB, kBA];
    [Key<out Object>+] keys = keysA.append(keysB);
    
    beforeTest
    shared void fill() {
        for (node in nodes) {
            node.put(kA, A());
            node.put(kAA, AA());
            node.put(kAAA, AAA());
            node.put(kAAB, AAB());
            node.put(kAB, AB());
            node.put(kABA, ABA());
            node.put(kB, B());
            node.put(kBA, BA());
        }
    }
    
    test
    shared void singleKey() {
        outerNode.visit(RemoveExtraInfoVisitor(kA));
        for (node in nodes) {
            for (key in keys) {
                if (key == kA) {
                    assertFalse(node.get(key) exists);
                } else {
                    assertTrue(node.get(key) exists);
                }
            }
        }
    }
    
    test
    shared void someKeys() {
        outerNode.visit(RemoveExtraInfoVisitor(*keysAA));
        for (node in nodes) {
            for (key in keys) {
                if (key in keysAA) {
                    assertFalse(node.get(key) exists);
                } else {
                    assertTrue(node.get(key) exists);
                }
            }
        }
    }
    
    test
    shared void allKeys() {
        outerNode.visit(RemoveExtraInfoVisitor(*keys));
        for (node in nodes) {
            for (key in keys) {
                assertFalse(node.get(key) exists);
            }
        }
    }
}
