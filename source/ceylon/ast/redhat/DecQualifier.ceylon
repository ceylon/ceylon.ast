import ceylon.ast.core {
    DecQualifier,
    PackageQualifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JQualifiedType=QualifiedType,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[StaticType|JStaticType]] to a `ceylon.ast` [[DecQualifier]]."
DecQualifier decQualifierToCeylon(JStaticType decQualifier) {
    assert (is JBaseType|JQualifiedType decQualifier);
    switch (decQualifier)
    case (is JBaseType) {
        return DecQualifier([identifierToCeylon(decQualifier.identifier)], decQualifier.packageQualified then PackageQualifier());
    }
    case (is JQualifiedType) {
        value nested = decQualifierToCeylon(decQualifier.outerType);
        return DecQualifier(nested.components.withTrailing(identifierToCeylon(decQualifier.identifier)), nested.packageQualifier);
    }
}
