import ceylon.ast.core {
    Resource,
    SpecifiedVariable,
    Type,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JResource=Resource,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[Resource|JResource]] to a `ceylon.ast` [[Resource]]."
shared Resource resourceToCeylon(JResource resource) {
    if (exists jVariable = resource.variable) {
        "Resource can’t have both a variable and an expression"
        assert (!resource.expression exists);
        assert (exists jSpecifierExpression = jVariable.specifierExpression);
        Type|ValueModifier? type;
        assert (is JStaticType|JValueModifier jType = jVariable.type);
        switch (jType)
        case (is JStaticType) { type = typeToCeylon(jType); }
        case (is JValueModifier) {
            if (jType.mainToken exists) {
                type = valueModifierToCeylon(jType);
            } else {
                // synthetic ValueModifier
                type = null;
            }
        }
        return Resource(SpecifiedVariable(lIdentifierToCeylon(jVariable.identifier), specifierToCeylon(jSpecifierExpression), type));
    } else {
        "Resource must have either a variable or an expression"
        assert (exists jExpression = resource.expression);
        return Resource(expressionToCeylon(jExpression));
    }
}

"Compiles the given [[code]] for a Resource
 into a [[Resource]] using the Ceylon compiler
 (more specifically, the rule for a `resource`)."
shared Resource? compileResource(String code) {
    if (exists jResource = createParser(code).resource()) {
        return resourceToCeylon(jResource);
    } else {
        return null;
    }
}
