import ceylon.ast.core {
    SwitchCaseElse,
    SwitchCases,
    SwitchClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    switchCaseElseToCeylon,
    parseSwitchCaseElse
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JSwitchStatement=SwitchStatement
    }
}

shared object switchCaseElse satisfies ConcreteTest<SwitchCaseElse,JSwitchStatement> {
    
    String->SwitchCaseElse construct(String->SwitchClause clause, String->SwitchCases cases)
            => "``clause.key``\n``cases.key``" -> SwitchCaseElse(clause.item, cases.item);
    
    shared String->SwitchCaseElse switchCaseElse = construct(switchClause.switchIClause, switchCases.switchCases);
    
    parse = parseSwitchCaseElse;
    fromCeylon = RedHatTransformer.transformSwitchCaseElse;
    toCeylon = switchCaseElseToCeylon;
    codes = [switchCaseElse];
}
