import ceylon.ast.core {
    Destructure,
    EntryPattern,
    TuplePattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDestructure=Destructure
    }
}

"Converts a RedHat AST [[Destructure|JDestructure]] to a `ceylon.ast` [[Destructure]]."
shared Destructure destructureToCeylon(JDestructure destructure) {
    assert (is TuplePattern|EntryPattern pattern = patternToCeylon(destructure.pattern));
    value specifier = specifierToCeylon(destructure.specifierExpression);
    value valueModifier = valueModifierToCeylon(destructure.type);
    return Destructure(pattern, specifier, valueModifier);
}

"Compiles the given [[code]] for a Destructure
 into a [[Destructure]] using the Ceylon compiler
 (more specifically, the rule for a `destructure`)."
shared Destructure? compileDestructure(String code) {
    if (exists jDestructure = createParser(code).destructure()) {
        return destructureToCeylon(jDestructure);
    } else {
        return null;
    }
}
