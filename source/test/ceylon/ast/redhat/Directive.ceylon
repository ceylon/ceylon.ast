import ceylon.ast.core {
    Directive
}
import ceylon.ast.redhat {
    RedHatTransformer,
    directiveToCeylon,
    parseDirective
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDirective=Directive
    }
}

shared object directive satisfies AbstractTest<Directive,JDirective> {
    parse = parseDirective;
    fromCeylon = RedHatTransformer.transformDirective;
    toCeylon = directiveToCeylon;
    
    tests = [\ireturn, \ithrow, \ibreak, \icontinue];
}
