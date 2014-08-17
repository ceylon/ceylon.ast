import ceylon.ast.core {
    ExistsOrNonemptyCondition
}
import ceylon.ast.redhat {
    RedHatTransformer,
    existsOrNonemptyConditionToCeylon,
    compileExistsOrNonemptyCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExistsOrNonemptyCondition=ExistsOrNonemptyCondition
    }
}

shared object existsOrNonemptyCondition satisfies AbstractTest<ExistsOrNonemptyCondition,JExistsOrNonemptyCondition> {
    compile = compileExistsOrNonemptyCondition;
    fromCeylon = RedHatTransformer.transformExistsOrNonemptyCondition;
    toCeylon = existsOrNonemptyConditionToCeylon;
    
    tests = [existsCondition, nonemptyCondition];
}
