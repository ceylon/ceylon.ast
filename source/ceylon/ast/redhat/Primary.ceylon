import ceylon.ast.core {
    Primary
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAtom=Atom,
        JPrimary=Primary
    }
}
import ceylon.ast.redhat {
    createParser
}

"Converts a RedHat AST [[Primary|JPrimary]] to a `ceylon.ast` [[Primary]]."
shared Primary primaryToCeylon(JPrimary primary) {
    switch (primary)
    case (is JAtom) { return atomToCeylon(primary); }
    else {
        throw AssertionError("Unknown primary type, or not a primary");
    }
}

"Compiles the given [[code]] for a Primary
 into a [[Primary]] using the Ceylon compiler
 (more specifically, the rule for a `primary`)."
shared Primary? compilePrimary(String code) {
    if (exists jPrimary = createParser(code).primary()) {
        return primaryToCeylon(jPrimary);
    } else {
        return null;
    }
}
