import ceylon.ast.core {
    CaseTypes,
    MemberName,
    PrimaryType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    caseTypesToCeylon,
    parseCaseTypes
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JCaseTypes=CaseTypes
    }
}

shared object caseTypes satisfies ConcreteTest<CaseTypes,JCaseTypes> {
    
    String->CaseTypes construct(<String->PrimaryType|MemberName>+ caseTypes)
            => "of ``"|".join(caseTypes*.key)``" -> CaseTypes(caseTypes*.item);
    
    shared String->CaseTypes ofStringIntegerFloatCaseTypes = construct(baseType.stringType, baseType.integerType, baseType.floatType);
    
    // not tested directly, but used by other tests
    shared String->CaseTypes ofNullCaseTypes = construct(identifier.nullLIdentifier);
    
    parse = parseCaseTypes;
    fromCeylon = RedHatTransformer.transformCaseTypes;
    toCeylon = caseTypesToCeylon;
    codes = [ofStringIntegerFloatCaseTypes];
}
