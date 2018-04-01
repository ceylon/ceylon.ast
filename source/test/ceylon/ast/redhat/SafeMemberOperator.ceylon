import ceylon.ast.core {
    SafeMemberOperator
}
import ceylon.ast.redhat {
    RedHatTransformer,
    safeMemberOperatorToCeylon,
    parseSafeMemberOperator
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JSafeMemberOp=SafeMemberOp
    }
}

shared object safeMemberOperator satisfies ConcreteTest<SafeMemberOperator,JSafeMemberOp> {
    
    shared String->SafeMemberOperator safeMemberOperator = "?." -> SafeMemberOperator();
    
    parse = parseSafeMemberOperator;
    fromCeylon = RedHatTransformer.transformSafeMemberOperator;
    toCeylon = safeMemberOperatorToCeylon;
    codes = [safeMemberOperator];
}
