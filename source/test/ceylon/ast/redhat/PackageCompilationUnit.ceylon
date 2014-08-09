import ceylon.ast.core {
    Import,
    PackageCompilationUnit,
    PackageDescriptor
}
import ceylon.ast.redhat {
    RedHatTransformer,
    packageCompilationUnitToCeylon,
    compilePackageCompilationUnit
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}

shared object packageCompilationUnit satisfies ConcreteTest<PackageCompilationUnit,JCompilationUnit> {
    
    String->PackageCompilationUnit construct(String->PackageDescriptor packageDescriptor, <String->Import>[] imports = [])
            => "``"".join(imports*.key)`` ``packageDescriptor.key``"->PackageCompilationUnit(packageDescriptor.item, imports*.item);
    
    shared String->PackageCompilationUnit ceylonAstCorePackageCompilationUnit = construct(packageDescriptor.ceylonAstCorePackageDescriptor);
    
    compile = compilePackageCompilationUnit;
    fromCeylon = RedHatTransformer.transformPackageCompilationUnit;
    toCeylon = packageCompilationUnitToCeylon;
    codes = [ceylonAstCorePackageCompilationUnit];
}
