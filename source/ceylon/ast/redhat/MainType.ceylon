import ceylon.ast.core {
    Node,
    MainType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JUnionType=UnionType,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[StaticType|JStaticType]] to a `ceylon.ast` [[MainType]]."
shared MainType mainTypeToCeylon(JStaticType mainType, Anything(JNode,Node) update = noop) {
    if (is JUnionType mainType) {
        return unionTypeToCeylon(mainType, update);
    } else {
        return unionableTypeToCeylon(mainType, update);
    }
}

"Parses the given [[code]] for a Main Type
 into a [[MainType]] using the Ceylon compiler
 (more specifically, the rule for a `unionType`)."
shared MainType? parseMainType(String code, Anything(JNode,Node) update = noop) {
    if (exists jType = createParser(code).unionType()) {
        return mainTypeToCeylon(jType, update);
    } else {
        return null;
    }
}
