import ceylon.ast.core {
    ForIterator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JForIterator=ForIterator,
        JKeyValueIterator=KeyValueIterator,
        JValueIterator=ValueIterator
    }
}

"Converts a RedHat AST [[ForIterator|JForIterator]] to a `ceylon.ast` [[ForIterator]]."
shared ForIterator forIteratorToCeylon(JForIterator forIterator) {
    assert (is JValueIterator|JKeyValueIterator forIterator);
    switch (forIterator)
    case (is JValueIterator) { return valueIteratorToCeylon(forIterator); }
    case (is JKeyValueIterator) { return keyValueIteratorToCeylon(forIterator); }
}

"Compiles the given [[code]] for a For Iterator
 into a [[ForIterator]] using the Ceylon compiler
 (more specifically, the rule for a `forIterator`)."
shared ForIterator? compileForIterator(String code) {
    if (exists jForIterator = createParser(code).forIterator()) {
        return forIteratorToCeylon(jForIterator);
    } else {
        return null;
    }
}
