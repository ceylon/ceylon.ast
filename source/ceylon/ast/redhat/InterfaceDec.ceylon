import ceylon.ast.core {
    DecQualifier,
    InterfaceDec,
    Node,
    PackageQualifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseType=BaseType,
        JInterfaceLiteral=InterfaceLiteral,
        JQualifiedType=QualifiedType
    }
}

"Converts a RedHat AST [[InterfaceLiteral|JInterfaceLiteral]] to a `ceylon.ast` [[InterfaceDec]]."
shared InterfaceDec interfaceDecToCeylon(JInterfaceLiteral interfaceDec, Anything(JNode,Node) update = noop) {
    assert (is JBaseType|JQualifiedType? jType = interfaceDec.type);
    switch (jType)
    case (is JBaseType) { return InterfaceDec(uIdentifierToCeylon(jType.identifier, update), DecQualifier([], jType.packageQualified then PackageQualifier())); }
    case (is JQualifiedType) { return InterfaceDec(uIdentifierToCeylon(jType.identifier, update), decQualifierToCeylon(jType.outerType, update)); }
    case (null) { return InterfaceDec(null, null); }
}

"Compiles the given [[code]] for an Interface Dec
 into an [[InterfaceDec]] using the Ceylon compiler
 (more specifically, the rule for an `metaLiteral`)."
shared InterfaceDec? compileInterfaceDec(String code, Anything(JNode,Node) update = noop) {
    if (is JInterfaceLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return interfaceDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
