import ceylon.ast.core {
    ControlStructure
}
import ceylon.ast.redhat {
    RedHatTransformer,
    controlStructureToCeylon,
    parseControlStructure
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JControlStatement=ControlStatement
    }
}

shared object controlStructure satisfies AbstractTest<ControlStructure,JControlStatement> {
    parse = parseControlStructure;
    fromCeylon = RedHatTransformer.transformControlStructure;
    toCeylon = controlStructureToCeylon;
    
    tests = [ifElse, \iwhile, forFail, switchCaseElse, tryCatchFinally, dynamicBlock];
}
