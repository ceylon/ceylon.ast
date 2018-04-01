import ceylon.ast.core {
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node
}

"Internal helper function.
 
 Usage:
 
     value nodes = jNodes.map(propagateUpdate(xToCeylon, update))"
N(JN) propagateUpdate<N, JN>(N(JN, Anything(JNode, Node)) toCeylon, Anything(JNode, Node) update)
        given N satisfies Node
        given JN satisfies JNode
        => (JN jNode) => toCeylon(jNode, update);
