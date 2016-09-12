import ceylon.ast.core {
    Body,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBlock=Block,
        JBody=Body,
        JClassBody=ClassBody,
        JInterfaceBody=InterfaceBody
    }
}

"Converts a RedHat AST [[Body|JBody]] to a `ceylon.ast` [[Body]]."
shared Body bodyToCeylon(JBody body, Anything(JNode,Node) update = noop) {
    assert (is JBlock|JClassBody|JInterfaceBody body);
    switch (body)
    case (is JBlock) { return blockToCeylon(body, update); }
    case (is JClassBody) { return classBodyToCeylon(body, update); }
    case (is JInterfaceBody) { return interfaceBodyToCeylon(body, update); }
}

/*
 There is no parseBody() method because it’s impossible to write:
 ‘{}’ can be a block, a class body, or an interface body.
 In fact, *every* block can be a class body and vice versa,
 every interface body can also be a block or a class body,
 and blocks and class bodies without statements can also be
 interface bodies. This is utterly ambiguous, and cannot possibly be parsed.
 */
