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
    compile = compileLiteral;
    fromCeylon = RedHatTransformer.transformLiteral;
    toCeylon = literalToCeylon;
    
    tests = [integerLiteral, floatLiteral, stringLiteral, characterLiteral];
}
