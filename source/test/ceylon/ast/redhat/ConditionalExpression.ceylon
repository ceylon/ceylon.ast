import ceylon.ast.core {
    ConditionalExpression,
    Node
}
import ceylon.ast.redhat {
    RedHatTransformer,
    conditionalExpressionToCeylon,
    compileConditionalExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIfExpression=IfExpression,
        JSwitchExpression=SwitchExpression
    }
}

shared object conditionalExpression satisfies AbstractTest<ConditionalExpression,JNode/*JIfExpression|JSwitchExpression*/> {
    compile = compileConditionalExpression;
    fromCeylon = RedHatTransformer.transformConditionalExpression;
    //toCeylon = conditionalExpressionToCeylon;
    shared actual ConditionalExpression toCeylon(JNode jNode, Anything(JNode,Node) update) {
        assert (is JIfExpression|JSwitchExpression jNode);
        return conditionalExpressionToCeylon(jNode, update);
    }
    
    tests = [ifElseExpression, switchCaseElseExpression];
}
