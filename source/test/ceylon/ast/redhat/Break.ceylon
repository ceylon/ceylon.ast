import ceylon.ast.core {
    Break
}
import ceylon.ast.redhat {
    RedHatTransformer,
    breakToCeylon,
    parseBreak
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JBreak=Break
    }
}

shared object \ibreak satisfies ConcreteTest<Break,JBreak> {
    
    shared String->Break \ibreak = "break;" -> Break();
    
    parse = parseBreak;
    fromCeylon = RedHatTransformer.transformBreak;
    toCeylon = breakToCeylon;
    codes = [\ibreak];
}
