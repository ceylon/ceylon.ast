import ceylon.ast.core {
    Node,
    PrimaryType,
    SatisfiedTypes
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSatisfiedTypes=SatisfiedTypes,
        JStaticType=StaticType
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts RedHat AST [[SatisfiedTypes|JSatisfiedTypes]] to `ceylon.ast` [[SatisfiedTypes]]."
shared SatisfiedTypes satisfiedTypesToCeylon(JSatisfiedTypes satisfiedTypes, Anything(JNode,Node) update = noop) {
    assert (nonempty types = CeylonIterable(satisfiedTypes.types).collect {
            PrimaryType collecting(JStaticType element) {
                assert (is PrimaryType ret = typeToCeylon(element, update));
                return ret;
            }
        });
    value result = SatisfiedTypes(types);
    update(satisfiedTypes, result);
    return result;
}

"Parses the given [[code]] for Satisfied Types
 into [[SatisfiedTypes]] using the Ceylon compiler
 (more specifically, the rule for `satisfiedTypes`)."
shared SatisfiedTypes? parseSatisfiedTypes(String code, Anything(JNode,Node) update = noop) {
    if (exists jSatisfiedTypes = createParser(code).satisfiedTypes()) {
        return satisfiedTypesToCeylon(jSatisfiedTypes, update);
    } else {
        return null;
    }
}
