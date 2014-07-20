import ceylon.ast.core {
    GivenDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JTypeParameterLiteral=TypeParameterLiteral
    }
}

"Converts a RedHat AST [[TypeParameterLiteral|JTypeParameterLiteral]] to a `ceylon.ast` [[GivenDec]]."
shared GivenDec givenDecToCeylon(JTypeParameterLiteral givenDec) {
    assert (is JBaseType type = givenDec.type);
    return GivenDec(uIdentifierToCeylon(type.identifier));
}

"Compiles the given [[code]] for a Given Dec
 into a [[GivenDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared GivenDec? compileGivenDec(String code) {
    if (is JTypeParameterLiteral jMetaLiteral = createParser(code).metaLiteral(),
        jMetaLiteral.type is JBaseType) {
        return givenDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
