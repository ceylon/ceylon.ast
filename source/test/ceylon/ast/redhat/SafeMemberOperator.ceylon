import ceylon.ast.core {
    SafeMemberOperator
}
import ceylon.ast.redhat {
    RedHatTransformer,
    safeMemberOperatorToCeylon,
    compileSafeMemberOperator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSafeMemberOp=SafeMemberOp
    }
}

shared object safeMemberOperator satisfies ConcreteTest<SafeMemberOperator,JSafeMemberOp> {
    
    shared String->SafeMemberOperator safeMemberOperator = "?."->SafeMemberOperator();
    
    compile = compileSafeMemberOperator;
    fromCeylon = RedHatTransformer.transformSafeMemberOperator;
    toCeylon = safeMemberOperatorToCeylon;
    codes = [safeMemberOperator];
}
