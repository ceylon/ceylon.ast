import ceylon.ast.core {
    EqualityOperation,
    Node
}
import ceylon.ast.redhat {
    RedHatTransformer,
    equalityOperationToCeylon,
    compileEqualityOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JEqualityOp=EqualityOp,
        JIdenticalOp=IdenticalOp
    }
}

shared object equalityOperation satisfies AbstractTest<EqualityOperation,JNode/*JEqualityOp|JIdenticalOp*/> {
    compile = compileEqualityOperation;
    fromCeylon = RedHatTransformer.transformEqualityOperation;
    //toCeylon = equalityOperationToCeylon;
    shared actual EqualityOperation toCeylon(JNode jNode, Anything(JNode,Node) update) {
        assert (is JEqualityOp|JIdenticalOp jNode);
        return equalityOperationToCeylon(jNode, update);
    }
    
    tests = [equalOperation, notEqualOperation, identicalOperation];
}
