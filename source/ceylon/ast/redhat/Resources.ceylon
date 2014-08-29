import ceylon.ast.core {
    Resources
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JResourceList=ResourceList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[Resources|JResourceList]] to `ceylon.ast` [[Resources]]."
shared Resources resourcesToCeylon(JResourceList resources) {
    assert (nonempty res = CeylonIterable(resources.resources).collect(resourceToCeylon));
    return Resources(res);
}

"Compiles the given [[code]] for Resources
 into [[Resources]] using the Ceylon compiler
 (more specifically, the rule for `resources`)."
shared Resources? compileResources(String code) {
    if (exists jResources = createParser(code).resources()) {
        return resourcesToCeylon(jResources);
    } else {
        return null;
    }
}
