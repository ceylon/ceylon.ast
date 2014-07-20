import ceylon.ast.core {
    FullPackageName,
    LIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    fullPackageNameToCeylon,
    compileFullPackageName
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportPath=ImportPath
    }
}

shared object fullPackageName satisfies ConcreteTest<FullPackageName,JImportPath> {
    
    shared String->FullPackageName lidUidFullPackageName
            = "ceylon.ast.core"->FullPackageName([
            LIdentifier("ceylon"),
            LIdentifier("ast"),
            LIdentifier("core")
        ]);
    
    compile = compileFullPackageName;
    fromCeylon = RedHatTransformer.transformFullPackageName;
    toCeylon = fullPackageNameToCeylon;
    codes = [lidUidFullPackageName];
}
