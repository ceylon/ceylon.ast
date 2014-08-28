import ceylon.ast.core {
    Block,
    CatchClause,
    UnspecifiedVariable,
    LIdentifier,
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    catchClauseToCeylon,
    compileCatchClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCatchClause=CatchClause
    }
}

shared object catchClause satisfies ConcreteTest<CatchClause,JCatchClause> {
    
    String->CatchClause construct(<String->Type>? type, String->LIdentifier name, String->Block block)
            => "catch (`` type?.key else "" `` ``name.key``) ``block.key``"->CatchClause(UnspecifiedVariable(name.item, type?.item), block.item);
    
    shared String->CatchClause catchEDoNothingClause = construct(null, identifier.eLIdentifier, block.emptyBlock);
    shared String->CatchClause catchThrowableTPrintHelloWorldClause = construct(baseType.throwableType, identifier.tLIdentifier, block.printHelloWorldBlock);
    
    compile = compileCatchClause;
    fromCeylon = RedHatTransformer.transformCatchClause;
    toCeylon = catchClauseToCeylon;
    codes = [catchEDoNothingClause, catchThrowableTPrintHelloWorldClause];
}
