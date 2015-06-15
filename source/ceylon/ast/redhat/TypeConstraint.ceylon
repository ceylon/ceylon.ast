import ceylon.ast.core {
    CaseTypes,
    Node,
    SatisfiedTypes,
    TypeConstraint
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JTypeConstraint=TypeConstraint
    }
}

"Converts a RedHat AST [[TypeConstraint|JTypeConstraint]] to a `ceylon.ast` [[TypeConstraint]]."
shared TypeConstraint typeConstraintToCeylon(JTypeConstraint typeConstraint, Anything(JNode,Node) update = noop) {
    "Lower bound type constraint not supported"
    assert (!typeConstraint.abstractedType exists);
    CaseTypes? caseTypes;
    if (exists jCaseTypes = typeConstraint.caseTypes) {
        caseTypes = caseTypesToCeylon(jCaseTypes, update);
    } else {
        caseTypes = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = typeConstraint.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes, update);
    } else {
        satisfiedTypes = null;
    }
    value result = TypeConstraint {
        parameterName = uIdentifierToCeylon(typeConstraint.identifier, update);
        caseTypes = caseTypes;
        satisfiedTypes = satisfiedTypes;
    };
    update(typeConstraint, result);
    return result;
}

"Compiles the given [[code]] for a Type Constraint
 into a [[TypeConstraint]] using the Ceylon compiler
 (more specifically, the rule for a `typeConstraint`)."
shared TypeConstraint? compileTypeConstraint(String code, Anything(JNode,Node) update = noop) {
    if (exists jTypeConstraint = createParser(code).typeConstraint(),
        !jTypeConstraint.abstractedType exists) {
        return typeConstraintToCeylon(jTypeConstraint, update);
    } else {
        return null;
    }
}
