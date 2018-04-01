import ceylon.ast.core {
    Condition
}
import ceylon.ast.redhat {
    RedHatTransformer,
    conditionToCeylon,
    parseCondition
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JCondition=Condition
    }
}

shared object condition satisfies AbstractTest<Condition,JCondition> {
    parse = parseCondition;
    fromCeylon = RedHatTransformer.transformCondition;
    toCeylon = conditionToCeylon;
    
    tests = [booleanCondition, isCondition, existsOrNonemptyCondition];
}
