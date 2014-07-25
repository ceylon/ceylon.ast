import ceylon.ast.core {
    ClosedBound
}
import ceylon.ast.redhat {
    RedHatTransformer,
    closedBoundToCeylon
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClosedBound=ClosedBound
    }
}

shared object closedBound satisfies ConversionTest<ClosedBound,JClosedBound> {
    
    shared ClosedBound _1138ClosedBound = ClosedBound(integerLiteral._1138IntegerLiteral.item);
    shared ClosedBound cClosedBound = ClosedBound(characterLiteral.capitalCCharacterLiteral.item);
    
    shared String->ClosedBound _1138ClosedBound_withCode
            = integerLiteral._1138IntegerLiteral.key->ClosedBound(integerLiteral._1138IntegerLiteral.item);
    shared String->ClosedBound cClosedBound_withCode
            = characterLiteral.capitalCCharacterLiteral.key->ClosedBound(characterLiteral.capitalCCharacterLiteral.item);
    
    fromCeylon = RedHatTransformer.transformClosedBound;
    toCeylon = closedBoundToCeylon;
    nodes = [_1138ClosedBound, cClosedBound];
}
