import ceylon.ast.core {
    Literal
}
import ceylon.ast.redhat {
    RedHatTransformer,
    literalToCeylon,
    compileLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLiteral=Literal
    }
}

shared object literal satisfies AbstractTest<Literal,JLiteral> {
    shared actual Literal? compile(String code) => compileLiteral(code);
    shared actual JLiteral fromCeylon(RedHatTransformer transformer)(Literal node) => transformer.transformLiteral(node);
    shared actual Literal toCeylon(JLiteral node) => literalToCeylon(node);
    
    tests = [integerLiteral, floatLiteral, stringLiteral, characterLiteral];
}
