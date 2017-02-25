import ceylon.ast.core {
    ClassDec,
    DecQualifier,
    Node,
    PackageQualifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseType=BaseType,
        JClassLiteral=ClassLiteral,
        JQualifiedType=QualifiedType
    }
}

"Converts a RedHat AST [[ClassLiteral|JClassLiteral]] to a `ceylon.ast` [[ClassDec]]."
shared ClassDec classDecToCeylon(JClassLiteral classDec, Anything(JNode, Node) update = noop) {
    ClassDec result;
    if (exists jType = classDec.type) {
        assert (is JBaseType|JQualifiedType jType);
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
            result = ClassDec(identifierToCeylon(jType.identifier, update), decQualifier);
        }
        case (is JQualifiedType) { result = ClassDec(identifierToCeylon(jType.identifier, update), decQualifierToCeylon(jType.outerType, update)); }
    } else {
        result = ClassDec(null, null);
    }
    update(classDec, result);
    return result;
}

"Parses the given [[code]] for a Class Dec
 into a [[ClassDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared ClassDec? parseClassDec(String code, Anything(JNode, Node) update = noop) {
    if (is JClassLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return classDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
