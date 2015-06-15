import ceylon.ast.core {
    Node,
    ObjectExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JObjectExpression=ObjectExpression
    }
}

"Converts a RedHat AST [[ObjectExpression|JObjectExpression]] to a `ceylon.ast` [[ObjectExpression]]."
shared ObjectExpression objectExpressionToCeylon(JObjectExpression objectExpression, Anything(JNode,Node) update = noop) {
    value result = ObjectExpression {
        body = classBodyToCeylon(objectExpression.classBody, update);
        value extendedType {
            if (exists jExtendedType = objectExpression.extendedType) {
                return extendedTypeToCeylon(jExtendedType, update);
            } else {
                return null;
            }
        }
        value satisfiedTypes {
            if (exists jSatisfiedTypes = objectExpression.satisfiedTypes) {
                return satisfiedTypesToCeylon(jSatisfiedTypes, update);
            } else {
                return null;
            }
        }
    };
    update(objectExpression, result);
    return result;
}

"Compiles the given [[code]] for an Object Expression
 into an [[ObjectExpression]] using the Ceylon compiler
 (more specifically, the rule for an `objectExpression`)."
shared ObjectExpression? compileObjectExpression(String code, Anything(JNode,Node) update = noop) {
    if (exists jObjectExpression = createParser(code).objectExpression()) {
        return objectExpressionToCeylon(jObjectExpression, update);
    } else {
        return null;
    }
}
