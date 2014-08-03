import ceylon.ast.core {
    PrimaryType,
    SatisfiedTypes
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSatisfiedTypes=SatisfiedTypes,
        JStaticType=StaticType
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts RedHat AST [[SatisfiedTypes|JSatisfiedTypes]] to `ceylon.ast` [[SatisfiedTypes]]."
shared SatisfiedTypes satisfiedTypesToCeylon(JSatisfiedTypes satisfiedTypes) {
    assert (nonempty types = CeylonIterable(satisfiedTypes.types).collect {
            PrimaryType collecting(JStaticType element) {
                assert (is PrimaryType ret = typeToCeylon(element));
                return ret;
            }
        });
    return SatisfiedTypes(types);
}

"Compiles the given [[code]] for Satisfied Types
 into [[SatisfiedTypes]] using the Ceylon compiler
 (more specifically, the rule for `satisfiedTypes`)."
shared SatisfiedTypes? compileSatisfiedTypes(String code) {
    if (exists jSatisfiedTypes = createParser(code).satisfiedTypes()) {
        return satisfiedTypesToCeylon(jSatisfiedTypes);
    } else {
        return null;
    }
}
