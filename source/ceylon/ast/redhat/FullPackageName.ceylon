import ceylon.ast.core {
    FullPackageName
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportPath=ImportPath
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ImportPath|JImportPath]] to a `ceylon.ast` [[FullPackageName]]."
shared FullPackageName fullPackageNameToCeylon(JImportPath fullPackageName) {
    assert (nonempty components = CeylonIterable(fullPackageName.identifiers).collect(pIdentifierToCeylon));
    return FullPackageName(components);
}

"Compiles the given [[code]] for a Full Package Name
 into a [[FullPackageName]] using the Ceylon compiler
 (more specifically, the rule for a `fullPackageName`)."
shared FullPackageName? compileFullPackageName(String code) {
    if (exists jPackagePath = createParser(code).packagePath()) {
        return fullPackageNameToCeylon(jPackagePath);
    } else {
        return null;
    }
}
