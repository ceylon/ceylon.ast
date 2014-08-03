import ceylon.ast.core {
    CaseTypes,
    SatisfiedTypes,
    TypeConstraint
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeConstraint=TypeConstraint
    }
}

"Converts a RedHat AST [[TypeConstraint|JTypeConstraint]] to a `ceylon.ast` [[TypeConstraint]]."
shared TypeConstraint typeConstraintToCeylon(JTypeConstraint typeConstraint) {
    "Type parameters with possible instantiation not supported"
    assert (!typeConstraint.parameterList exists);
    "Lower bound type constraint not supported"
    assert (!typeConstraint.abstractedType exists);
    CaseTypes? caseTypes;
    if (exists jCaseTypes = typeConstraint.caseTypes) {
        caseTypes = caseTypesToCeylon(jCaseTypes);
    } else {
        caseTypes = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = typeConstraint.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes);
    } else {
        satisfiedTypes = null;
    }
    return TypeConstraint {
        parameterName = uIdentifierToCeylon(typeConstraint.identifier);
        caseTypes = caseTypes;
        satisfiedTypes = satisfiedTypes;
    };
}

"Compiles the given [[code]] for a Type Constraint
 into a [[TypeConstraint]] using the Ceylon compiler
 (more specifically, the rule for a `typeConstraint`)."
shared TypeConstraint? compileTypeConstraint(String code) {
    if (exists jTypeConstraint = createParser(code).typeConstraint(),
        !jTypeConstraint.parameterList exists,
        !jTypeConstraint.abstractedType exists) {
        return typeConstraintToCeylon(jTypeConstraint);
    } else {
        return null;
    }
}
