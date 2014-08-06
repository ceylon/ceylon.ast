import ceylon.ast.core {
    PackageDescriptor
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPackageDescriptor=PackageDescriptor
    }
}

"Converts a RedHat AST [[PackageDescriptor|JPackageDescriptor]] to a `ceylon.ast` [[PackageDescriptor]]."
shared PackageDescriptor packageDescriptorToCeylon(JPackageDescriptor packageDescriptor) {
    return PackageDescriptor(fullPackageNameToCeylon(packageDescriptor.importPath), annotationsToCeylon(packageDescriptor.annotationList));
}

"Compiles the given [[code]] for a Package Descriptor
 into a [[PackageDescriptor]] using the Ceylon compiler
 (more specifically, the rule for a `packageDescriptor`)."
shared PackageDescriptor? compilePackageDescriptor(String code) {
    if (exists jPackageDescriptor = createParser(code).packageDescriptor()) {
        return packageDescriptorToCeylon(jPackageDescriptor);
    } else {
        return null;
    }
}
