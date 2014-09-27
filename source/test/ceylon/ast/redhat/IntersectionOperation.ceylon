import ceylon.ast.core {
    Editor,
    GroupedExpression,
    IntersectionOperation,
    InvertingExpression,
    IntersectingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    intersectionOperationToCeylon,
    compileIntersectionOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIntersectionOp=IntersectionOp
    }
}
import ceylon.test {
    test,
    assertEquals
}

shared object intersectionOperation satisfies ConcreteTest<IntersectionOperation,JIntersectionOp> {
    
    String->IntersectionOperation construct(String->IntersectingExpression left, String->InvertingExpression right)
            => "``left.key``&``right.key``"->IntersectionOperation(left.item, right.item);
    
    shared String->IntersectionOperation aIntersectBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    shared String->IntersectionOperation aIntersectBIntersectCExpression = construct(aIntersectBExpression, baseExpression.cExpression);
    shared String->IntersectionOperation aIntersectBGroupedIntersectCExpression => construct(groupedExpression.aIntersectBGroupedExpression, baseExpression.cExpression); // needs to be lazy to avoid cyclic initialization
    
    compile = compileIntersectionOperation;
    fromCeylon = RedHatTransformer.transformIntersectionOperation;
    toCeylon = intersectionOperationToCeylon;
    codes = [aIntersectBExpression, aIntersectBIntersectCExpression];
    
    test
    shared void testAssociativity() {
        object ungroupEditor satisfies Editor {
            shared actual IntersectionOperation transformIntersectionOperation(IntersectionOperation that) {
                if (is GroupedExpression left = that.leftOperand, is IntersectingExpression inner = left.innerExpression) {
                    return IntersectionOperation(inner, that.rightOperand);
                } else {
                    return that;
                }
            }
        }
        assertEquals(aIntersectBIntersectCExpression.item, aIntersectBGroupedIntersectCExpression.item.transform(ungroupEditor));
    }
}
