import ceylon.ast.core {
    DecQualifier,
    UIdentifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseMemberExpression=BaseMemberExpression,
        JIdentifier=Identifier,
        JQualifiedType=QualifiedType,
        JStaticType=StaticType
    },
    Visitor
}
import ceylon.collection {
    LinkedList
}

"Converts a RedHat AST [[StaticType|JStaticType]] or [[BaseMemberExpression|JBaseMemberExpression]]
 to a `ceylon.ast` [[DecQualifier]]."
DecQualifier decQualifierToCeylon(JStaticType|JBaseMemberExpression decQualifier) {
    switch (decQualifier)
    case (is JStaticType) {
        value components = LinkedList<UIdentifier>();
        object visitor extends Visitor() {
            shared actual void visit(JIdentifier that)
                    => components.add(uIdentifierToCeylon(that));
            shared actual void visit(JQualifiedType that) {
                that.outerType.visit(this);
                that.identifier.visit(this);
            }
        }
        decQualifier.visit(visitor);
        assert (nonempty c = components.sequence());
        return DecQualifier(c);
    }
    case (is JBaseMemberExpression) {
        return DecQualifier([lIdentifierToCeylon(decQualifier.identifier)]);
    }
}
