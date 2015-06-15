import ceylon.ast.core {
    Node,
    PackageDescriptor
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JPackageDescriptor=PackageDescriptor
    }
}

"Converts a RedHat AST [[PackageDescriptor|JPackageDescriptor]] to a `ceylon.ast` [[PackageDescriptor]]."
shared PackageDescriptor packageDescriptorToCeylon(JPackageDescriptor packageDescriptor, Anything(JNode,Node) update = noop) {
    value result = PackageDescriptor(fullPackageNameToCeylon(packageDescriptor.importPath, update), annotationsToCeylon(packageDescriptor.annotationList, update));
    update(packageDescriptor, result);
    return result;
}

"Compiles the given [[code]] for a Package Descriptor
 into a [[PackageDescriptor]] using the Ceylon compiler
 (more specifically, the rule for a `packageDescriptor`)."
shared PackageDescriptor? compilePackageDescriptor(String code, Anything(JNode,Node) update = noop) {
    if (exists jPackageDescriptor = createParser(code).packageDescriptor()) {
        return packageDescriptorToCeylon(jPackageDescriptor, update);
    } else {
        return null;
    }
}
