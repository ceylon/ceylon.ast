import ceylon.ast.core {
    FailClause,
    ForClause,
    ForFail
}
import ceylon.ast.redhat {
    RedHatTransformer,
    forFailToCeylon,
    parseForFail
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JForStatement=ForStatement
    }
}

shared object forFail satisfies ConcreteTest<ForFail,JForStatement> {
    
    String->ForFail construct(String->ForClause forClause, <String->FailClause>? failClause = null)
            => "``forClause.key```` failClause?.key else "" ``"->ForFail(forClause.item, failClause?.item);
    
    shared String->ForFail printPersonNameInPeopleForFail = construct(forClause.printPersonNameInPeopleForClause);
    shared String->ForFail printPersonNameInPeopleElsePrintHelloWorldForFail = construct(forClause.printPersonNameInPeopleForClause, failClause.printHelloWorldFailClause);
    
    parse = parseForFail;
    fromCeylon = RedHatTransformer.transformForFail;
    toCeylon = forFailToCeylon;
    codes = [printPersonNameInPeopleForFail, printPersonNameInPeopleElsePrintHelloWorldForFail];
}
