import ceylon.ast.core {
    Atom,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAtom=Atom,
        JDynamic=Dynamic,
        JExpression=Expression,
        JLiteral=Literal,
        JOuter=Outer,
        JPackage=Package,
        JParExpression=ParExpression,
        JSelfExpression=SelfExpression,
        JSequenceEnumeration=SequenceEnumeration,
        JStringTemplate=StringTemplate,
        JTuple=Tuple
    }
}

"Converts a RedHat AST [[Atom|JAtom]] to a `ceylon.ast` [[Atom]]."
shared Atom atomToCeylon(JAtom atom, Anything(JNode,Node) update = noop) {
    switch (atom)
    case (is JExpression) {
        if (is JParExpression atom) {
            return groupedExpressionToCeylon(atom, update);
        } else {
            // a JTerm wrapped in a JExpression
            assert (is Atom ret = expressionToCeylon(atom.term, update));
            return ret;
        }
    }
    case (is JLiteral) { return literalToCeylon(atom, update); }
    case (is JStringTemplate) { return stringTemplateToCeylon(atom, update); }
    case (is JSelfExpression|JOuter|JPackage) { return selfReferenceToCeylon(atom, update); }
    case (is JSequenceEnumeration) { return iterableToCeylon(atom, update); }
    case (is JTuple) { return tupleToCeylon(atom, update); }
    case (is JDynamic) { return dynamicValueToCeylon(atom, update); }
    else {
        throw AssertionError("Unknown atom type");
    }
}

"Parses the given [[code]] for an Atom
 into an [[Atom]] using the Ceylon compiler
 (more specifically, the rule for a `base`)."
shared Atom? parseAtom(String code, Anything(JNode,Node) update = noop) {
    if (is JAtom jAtom = createParser(code).base()) {
        return atomToCeylon(jAtom, update);
    } else {
        return null;
    }
}
