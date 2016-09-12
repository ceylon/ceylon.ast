import ceylon.ast.core {
    ExistsOrNonemptyCondition
}
import ceylon.ast.redhat {
    RedHatTransformer,
    existsOrNonemptyConditionToCeylon,
    parseExistsOrNonemptyCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExistsOrNonemptyCondition=ExistsOrNonemptyCondition
    }
}

shared object existsOrNonemptyCondition satisfies AbstractTest<ExistsOrNonemptyCondition,JExistsOrNonemptyCondition> {
    parse = parseExistsOrNonemptyCondition;
    fromCeylon = RedHatTransformer.transformExistsOrNonemptyCondition;
    toCeylon = existsOrNonemptyConditionToCeylon;
    
    tests = [existsCondition, nonemptyCondition];
}
