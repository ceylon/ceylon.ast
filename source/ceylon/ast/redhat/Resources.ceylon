import ceylon.ast.core {
    Node,
    Resources
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JResourceList=ResourceList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[Resources|JResourceList]] to `ceylon.ast` [[Resources]]."
shared Resources resourcesToCeylon(JResourceList resources, Anything(JNode,Node) update = noop) {
    assert (nonempty res = CeylonIterable(resources.resources).collect(propagateUpdate(resourceToCeylon, update)));
    value result = Resources(res);
    update(resources, result);
    return result;
}

"Parses the given [[code]] for Resources
 into [[Resources]] using the Ceylon compiler
 (more specifically, the rule for `resources`)."
shared Resources? parseResources(String code, Anything(JNode,Node) update = noop) {
    if (exists jResources = createParser(code).resources()) {
        return resourcesToCeylon(jResources, update);
    } else {
        return null;
    }
}
