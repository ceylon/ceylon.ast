import ceylon.ast.core {
    ConstructorDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNewLiteral=NewLiteral,
        JQualifiedType=QualifiedType
    }
}

"Converts a RedHat AST [[NewLiteral|JNewLiteral]] to a `ceylon.ast` [[ConstructorDec]]."
shared ConstructorDec constructorDecToCeylon(JNewLiteral constructorDec) {
    assert (is JQualifiedType jType = constructorDec.type,
        !jType.typeArgumentList exists);
    value qualifier = decQualifierToCeylon(jType.outerType);
    value name = uIdentifierToCeylon(jType.identifier);
    return ConstructorDec(name, qualifier);
}

"Compiles the given [[code]] for a Constructor Dec
 into a [[ConstructorDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared ConstructorDec? compileConstructorDec(String code) {
    if (is JNewLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return constructorDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
