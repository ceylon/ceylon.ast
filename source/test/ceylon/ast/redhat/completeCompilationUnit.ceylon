import ceylon.ast.core {
    CompilationUnit
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}
import ceylon.ast.redhat {
    RedHatTransformer,
    compilationUnitToCeylon
}
import ceylon.ast.samples.completeCompilationUnit {
    completeCU=completeCompilationUnit
}

object completeCompilationUnit satisfies ConversionTest<CompilationUnit,JCompilationUnit> {
    fromCeylon = RedHatTransformer.transformCompilationUnit;
    toCeylon = compilationUnitToCeylon;
    nodes = [completeCU];
}
