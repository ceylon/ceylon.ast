import ceylon.ast.core {
    ConstructorDec,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JNewLiteral=NewLiteral,
        JQualifiedType=QualifiedType
    }
}

"Converts a RedHat AST [[NewLiteral|JNewLiteral]] to a `ceylon.ast` [[ConstructorDec]]."
shared ConstructorDec constructorDecToCeylon(JNewLiteral constructorDec, Anything(JNode,Node) update = noop) {
    assert (is JQualifiedType jType = constructorDec.type,
        !jType.typeArgumentList exists);
    value qualifier = decQualifierToCeylon(jType.outerType, update);
    value name = uIdentifierToCeylon(jType.identifier, update);
    value result = ConstructorDec(name, qualifier);
    update(constructorDec, result);
    return result;
}

"Compiles the given [[code]] for a Constructor Dec
 into a [[ConstructorDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared ConstructorDec? compileConstructorDec(String code, Anything(JNode,Node) update = noop) {
    if (is JNewLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return constructorDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
