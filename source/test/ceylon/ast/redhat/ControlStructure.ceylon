import ceylon.ast.core {
    ControlStructure
}
import ceylon.ast.redhat {
    RedHatTransformer,
    controlStructureToCeylon,
    compileControlStructure
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JControlStatement=ControlStatement
    }
}

shared object controlStructure satisfies AbstractTest<ControlStructure,JControlStatement> {
    compile = compileControlStructure;
    fromCeylon = RedHatTransformer.transformControlStructure;
    toCeylon = controlStructureToCeylon;
    
    tests = [ifElse, \iwhile];
}
