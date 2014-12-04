import ceylon.ast.core {
    ObjectExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JObjectExpression=ObjectExpression
    }
}

"Converts a RedHat AST [[ObjectExpression|JObjectExpression]] to a `ceylon.ast` [[ObjectExpression]]."
shared ObjectExpression objectExpressionToCeylon(JObjectExpression objectExpression) {
    return ObjectExpression {
        body = classBodyToCeylon(objectExpression.classBody);
        value extendedType {
            if (exists jExtendedType = objectExpression.extendedType) {
                return extendedTypeToCeylon(jExtendedType);
            } else {
                return null;
            }
        }
        value satisfiedTypes {
            if (exists jSatisfiedTypes = objectExpression.satisfiedTypes) {
                return satisfiedTypesToCeylon(jSatisfiedTypes);
            } else {
                return null;
            }
        }
    };
}

"Compiles the given [[code]] for an Object Expression
 into an [[ObjectExpression]] using the Ceylon compiler
 (more specifically, the rule for an `objectExpression`)."
shared ObjectExpression? compileObjectExpression(String code) {
    if (exists jObjectExpression = createParser(code).objectExpression()) {
        return objectExpressionToCeylon(jObjectExpression);
    } else {
        return null;
    }
}
