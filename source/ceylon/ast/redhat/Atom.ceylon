import ceylon.ast.core {
    Atom
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAtom=Atom,
        JExpression=Expression,
        JLiteral=Literal,
        JOuter=Outer,
        JPackage=Package,
        JSelfExpression=SelfExpression
    }
}

"Converts a RedHat AST [[Atom|JAtom]] to a `ceylon.ast` [[Atom]]."
shared Atom atomToCeylon(JAtom atom) {
    switch (atom)
    case (is JExpression) { return groupedExpressionToCeylon(atom); }
    case (is JLiteral) { return literalToCeylon(atom); }
    case (is JSelfExpression|JOuter|JPackage) { return selfReferenceToCeylon(atom); }
    else {
        throw AssertionError("Unknown atom type");
    }
}

"Compiles the given [[code]] for an Atom
 into an [[Atom]] using the Ceylon compiler
 (more specifically, the rule for a `base`)."
shared Atom? compileAtom(String code) {
    if (is JAtom jAtom = createParser(code).base()) {
        return atomToCeylon(jAtom);
    } else {
        return null;
    }
}
