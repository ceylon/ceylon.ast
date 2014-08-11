import ceylon.ast.core {
    Break
}
import ceylon.ast.redhat {
    RedHatTransformer,
    breakToCeylon,
    compileBreak
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBreak=Break
    }
}

shared object \ibreak satisfies ConcreteTest<Break,JBreak> {
    
    shared String->Break \ibreak = "break;"->Break();
    
    compile = compileBreak;
    fromCeylon = RedHatTransformer.transformBreak;
    toCeylon = breakToCeylon;
    codes = [\ibreak];
}
