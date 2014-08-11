import ceylon.ast.core {
    Directive
}
import ceylon.ast.redhat {
    RedHatTransformer,
    directiveToCeylon,
    compileDirective
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDirective=Directive
    }
}

shared object directive satisfies AbstractTest<Directive,JDirective> {
    compile = compileDirective;
    fromCeylon = RedHatTransformer.transformDirective;
    toCeylon = directiveToCeylon;
    
    tests = [\ireturn, \ithrow, \ibreak, \icontinue];
}
