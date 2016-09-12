import ceylon.ast.core {
    Key,
    Node,
    ScopedKey
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node
}

"A key for attaching the RedHat AST [[Node|JNode]] from which a `ceylon.ast` [[Node]] was converted."
see (`function attachOriginalNode`, `module`)
shared Key<JNode> originalNodeKey = ScopedKey<JNode>(`module`, "originalNode");

"A function for attaching the RedHat AST [[Node|JNode]] from which a `ceylon.ast` [[Node]] was converted.
 To be used as a second parameter to any of the `XToCeylon` or `parseX` functions."
see (`value originalNodeKey`, `module`)
shared void attachOriginalNode(JNode original, Node result)
        => result.set(originalNodeKey, original);
