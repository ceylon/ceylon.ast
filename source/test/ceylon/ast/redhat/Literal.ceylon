import ceylon.ast.core {
    Literal
}
import ceylon.ast.redhat {
    RedHatTransformer,
    literalToCeylon,
    parseLiteral
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JLiteral=Literal
    }
}

shared object literal satisfies AbstractTest<Literal,JLiteral> {
    parse = parseLiteral;
    fromCeylon = RedHatTransformer.transformLiteral;
    toCeylon = literalToCeylon;
    
    tests = [integerLiteral, floatLiteral, stringLiteral, characterLiteral];
}
