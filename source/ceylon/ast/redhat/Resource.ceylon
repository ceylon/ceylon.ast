import ceylon.ast.core {
    Node,
    Resource,
    SpecifiedVariable,
    Type,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JResource=Resource,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[Resource|JResource]] to a `ceylon.ast` [[Resource]]."
shared Resource resourceToCeylon(JResource resource, Anything(JNode,Node) update = noop) {
    Resource result;
    if (exists jVariable = resource.variable) {
        "Resource can’t have both a variable and an expression"
        assert (!resource.expression exists);
        assert (exists jSpecifierExpression = jVariable.specifierExpression);
        Type|ValueModifier? type;
        assert (is JStaticType|JValueModifier jType = jVariable.type);
        switch (jType)
        case (is JStaticType) { type = typeToCeylon(jType, update); }
        case (is JValueModifier) {
            if (jType.mainToken exists) {
                type = valueModifierToCeylon(jType, update);
            } else {
                // synthetic ValueModifier
                type = null;
            }
        }
        value variable = SpecifiedVariable(lIdentifierToCeylon(jVariable.identifier, update), specifierToCeylon(jSpecifierExpression, update), type);
        update(jVariable, variable);
        result = Resource(variable);
    } else {
        "Resource must have either a variable or an expression"
        assert (exists jExpression = resource.expression);
        result = Resource(expressionToCeylon(jExpression, update));
    }
    update(resource, result);
    return result;
}

"Compiles the given [[code]] for a Resource
 into a [[Resource]] using the Ceylon compiler
 (more specifically, the rule for a `resource`)."
shared Resource? compileResource(String code, Anything(JNode,Node) update = noop) {
    if (exists jResource = createParser(code).resource()) {
        return resourceToCeylon(jResource, update);
    } else {
        return null;
    }
}
