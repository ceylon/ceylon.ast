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
shared InterfaceDec interfaceDecToCeylon(JInterfaceLiteral interfaceDec, Anything(JNode, Node) update = noop) {
    assert (is JBaseType|JQualifiedType? jType = interfaceDec.type);
    InterfaceDec result;
    switch (jType)
    case (is JBaseType) {
        PackageQualifier? packageQualifier;
        if (jType.packageQualified) {
            value pq = PackageQualifier();
            update(jType, pq);
            packageQualifier = pq;
        } else {
            packageQualifier = null;
        }
        value decQualifier = DecQualifier([], packageQualifier);
        update(jType, decQualifier);
        result = InterfaceDec(uIdentifierToCeylon(jType.identifier, update), decQualifier);
    }
    case (is JQualifiedType) { result = InterfaceDec(uIdentifierToCeylon(jType.identifier, update), decQualifierToCeylon(jType.outerType, update)); }
    case (null) { result = InterfaceDec(null, null); }
    update(interfaceDec, result);
    return result;
}

"Parses the given [[code]] for an Interface Dec
 into an [[InterfaceDec]] using the Ceylon compiler
 (more specifically, the rule for an `metaLiteral`)."
shared InterfaceDec? parseInterfaceDec(String code, Anything(JNode, Node) update = noop) {
    if (is JInterfaceLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return interfaceDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
