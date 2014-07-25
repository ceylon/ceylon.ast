import ceylon.ast.core {
    OpenBound
}
import ceylon.ast.redhat {
    RedHatTransformer,
    openBoundToCeylon
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOpenBound=OpenBound
    }
}

shared object openBound satisfies ConversionTest<OpenBound,JOpenBound> {
    
    shared OpenBound _1138OpenBound = OpenBound(integerLiteral._1138IntegerLiteral.item);
    shared OpenBound cOpenBound = OpenBound(characterLiteral.capitalCCharacterLiteral.item);
    
    shared String->OpenBound _1138OpenBound_withCode
            = integerLiteral._1138IntegerLiteral.key->OpenBound(integerLiteral._1138IntegerLiteral.item);
    shared String->OpenBound cOpenBound_withCode
            = characterLiteral.capitalCCharacterLiteral.key->OpenBound(characterLiteral.capitalCCharacterLiteral.item);
    
    fromCeylon = RedHatTransformer.transformOpenBound;
    toCeylon = openBoundToCeylon;
    nodes = [_1138OpenBound, cOpenBound];
}
