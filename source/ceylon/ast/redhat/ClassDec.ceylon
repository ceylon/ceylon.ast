import ceylon.ast.core {
    ClassDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JClassLiteral=ClassLiteral,
        JQualifiedType=QualifiedType
    }
}

"Converts a RedHat AST [[ClassLiteral|JClassLiteral]] to a `ceylon.ast` [[ClassDec]]."
shared ClassDec classDecToCeylon(JClassLiteral classDec) {
    if (exists jType = classDec.type) {
        assert (!classDec.objectExpression exists);
        assert (is JBaseType|JQualifiedType jType);
        switch (jType)
        case (is JBaseType) { return ClassDec(uIdentifierToCeylon(jType.identifier)); }
        case (is JQualifiedType) { return ClassDec(uIdentifierToCeylon(jType.identifier), decQualifierToCeylon(jType.outerType)); }
    } else {
        if (exists jObjectExpression = classDec.objectExpression) {
            return ClassDec(lIdentifierToCeylon(jObjectExpression.identifier));
        } else {
            return ClassDec(null);
        }
    }
}

"Compiles the given [[code]] for a Class Dec
 into a [[ClassDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared ClassDec? compileClassDec(String code) {
    if (is JClassLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return classDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
