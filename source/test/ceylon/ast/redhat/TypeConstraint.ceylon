import ceylon.ast.core {
    CaseTypes,
    SatisfiedTypes,
    TypeConstraint,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeConstraintToCeylon,
    parseTypeConstraint
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeConstraint=TypeConstraint
    }
}

shared object typeConstraint satisfies ConcreteTest<TypeConstraint,JTypeConstraint> {
    
    String->TypeConstraint construct(String->UIdentifier parameterName, <String->CaseTypes>? caseTypes = null, <String->SatisfiedTypes>? satisfiedTypes = null)
            => "given ``parameterName.key`` `` caseTypes?.key else "" `` `` satisfiedTypes?.key else "" ``" -> TypeConstraint(parameterName.item, caseTypes?.item, satisfiedTypes?.item);
    
    shared String->TypeConstraint emptyTypeConstraint = construct(identifier.uidUIdentifier);
    shared String->TypeConstraint nonemptyTypeConstraint = construct(identifier.uidUIdentifier, caseTypes.ofStringIntegerFloatCaseTypes, satisfiedTypes.satisfiesStringStarAndPrintableSatisfiedTypes);
    
    parse = parseTypeConstraint;
    fromCeylon = RedHatTransformer.transformTypeConstraint;
    toCeylon = typeConstraintToCeylon;
    codes = [emptyTypeConstraint, nonemptyTypeConstraint];
}
