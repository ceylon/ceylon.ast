import ceylon.ast.core {
    Node,
    UnaryArithmeticOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unaryArithmeticOperationToCeylon,
    compileUnaryArithmeticOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JNegativeOp=NegativeOp,
        JPositiveOp=PositiveOp
    }
}

shared object unaryArithmeticOperation satisfies AbstractTest<UnaryArithmeticOperation,JNode/*JNegativeOp|JPositiveOp*/> {
    compile = compileUnaryArithmeticOperation;
    fromCeylon = RedHatTransformer.transformUnaryArithmeticOperation;
    //toCeylon = unaryArithmeticOperationToCeylon;
    shared actual UnaryArithmeticOperation toCeylon(JNode jNode, Anything(JNode,Node) update) {
        assert (is JNegativeOp|JPositiveOp jNode);
        return unaryArithmeticOperationToCeylon(jNode, update);
    }
    
    tests = [identityOperation, negationOperation];
}
