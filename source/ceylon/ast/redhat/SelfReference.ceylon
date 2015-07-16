import ceylon.ast.core {
    Node,
    SelfReference,
    This,
    Super,
    Outer,
    Package
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSelfExpression=SelfExpression,
        JThis=This,
        JSuper=Super,
        JOuter=Outer,
        JPackage=Package
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        thisType=\iTHIS,
        superType=\iSUPER,
        outerType=\iOUTER,
        packageType=\iPACKAGE
    }
}

"Converts a RedHat AST [[SelfExpression|JSelfExpression]], [[Outer|JOuter]] or [[Package|JPackage]]
 to a `ceylon.ast` [[SelfReference]]."
throws (`class AssertionError`, "If the token type is wrong.")
shared SelfReference selfReferenceToCeylon(JSelfExpression|JOuter|JPackage selfReference, Anything(JNode,Node) update = noop) {
    assert (is JThis|JSuper|JOuter|JPackage selfReference);
    switch (selfReference)
    case (is JThis) { return thisToCeylon(selfReference, update); }
    case (is JSuper) { return superToCeylon(selfReference, update); }
    case (is JOuter) { return outerToCeylon(selfReference, update); }
    case (is JPackage) { return packageToCeylon(selfReference, update); }
}

"Converts a RedHat AST [[This|JThis]] to a `ceylon.ast` [[This]]."
throws (`class AssertionError`, "If the token type is not `THIS` or the token text is not `this`.")
shared This thisToCeylon(JThis \ithis, Anything(JNode,Node) update = noop) {
    assert (\ithis.mainToken.type == thisType, \ithis.mainToken.text == "this");
    value result = This();
    update(\ithis, result);
    return result;
}

"Converts a RedHat AST [[Super|JSuper]] to a `ceylon.ast` [[Super]]."
throws (`class AssertionError`, "If the token type is not `SUPER` or the token text is not `super`.")
shared Super superToCeylon(JSuper \isuper, Anything(JNode,Node) update = noop) {
    assert (\isuper.mainToken.type == superType, \isuper.mainToken.text == "super");
    value result = Super();
    update(\isuper, result);
    return result;
}

"Converts a RedHat AST [[Outer|JOuter]] to a `ceylon.ast` [[Outer]]."
throws (`class AssertionError`, "If the token type is not `OUTER` or the token text is not `outer`.")
shared Outer outerToCeylon(JOuter \iouter, Anything(JNode,Node) update = noop) {
    assert (\iouter.mainToken.type == outerType, \iouter.mainToken.text == "outer");
    value result = Outer();
    update(\iouter, result);
    return result;
}

"Converts a RedHat AST [[Package|JPackage]] to a `ceylon.ast` [[Package]]."
throws (`class AssertionError`, "If the token type is not `PACKAGE` or the token text is not `package`.")
shared Package packageToCeylon(JPackage \ipackage, Anything(JNode,Node) update = noop) {
    assert (\ipackage.mainToken.type == packageType, \ipackage.mainToken.text == "package");
    value result = Package();
    update(\ipackage, result);
    return result;
}

"Compiles the given [[code]] for a Self Reference
 into a [[SelfReference]] using the Ceylon compiler
 (more specifically, the rule for a `selfReference`)."
shared SelfReference? compileSelfReference(String code, Anything(JNode,Node) update = noop) {
    if (exists jSelfReference = createParser(code).selfReference()) {
        assert (is JSelfExpression|JOuter|JPackage jSelfReference);
        return selfReferenceToCeylon(jSelfReference, update);
    } else {
        return null;
    }
}

"Compiles the given [[code]] for a This
 into a [[This]] using the Ceylon compiler
 (more specifically, the rule for a `selfReference`)."
shared This? compileThis(String code, Anything(JNode,Node) update = noop) {
    if (is JThis jThis = createParser(code).selfReference()) {
        return thisToCeylon(jThis, update);
    } else {
        return null;
    }
}

"Compiles the given [[code]] for a Super
 into a [[Super]] using the Ceylon compiler
 (more specifically, the rule for a `selfReference`)."
shared Super? compileSuper(String code, Anything(JNode,Node) update = noop) {
    if (is JSuper jSuper = createParser(code).selfReference()) {
        return superToCeylon(jSuper, update);
    } else {
        return null;
    }
}

"Compiles the given [[code]] for an Outer
 into an [[Outer]] using the Ceylon compiler
 (more specifically, the rule for a `selfReference`)."
shared Outer? compileOuter(String code, Anything(JNode,Node) update = noop) {
    if (is JOuter jOuter = createParser(code).selfReference()) {
        return outerToCeylon(jOuter, update);
    } else {
        return null;
    }
}

"Compiles the given [[code]] for a Package
 into a [[Package]] using the Ceylon compiler
 (more specifically, the rule for a `selfReference`)."
shared Package? compilePackage(String code, Anything(JNode,Node) update = noop) {
    if (is JPackage jPackage = createParser(code).selfReference()) {
        return packageToCeylon(jPackage, update);
    } else {
        return null;
    }
}
