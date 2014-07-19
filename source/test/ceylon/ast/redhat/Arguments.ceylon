import ceylon.ast.core {
    Arguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    argumentsToCeylon,
    compileArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JArgumentList=ArgumentList
    }
}

shared object arguments satisfies AbstractTest<Arguments,JArgumentList> {
    compile = compileArguments;
    fromCeylon = RedHatTransformer.transformArguments;
    toCeylon = argumentsToCeylon;
    
    tests = [positionalArguments, namedArguments];
}
