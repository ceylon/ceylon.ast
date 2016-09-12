import ceylon.ast.core {
    DynamicModifier,
    DynamicValue,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDynamic=Dynamic
    }
}

"Converts a RedHat AST [[Dynamic|JDynamic]] to a `ceylon.ast` [[DynamicValue]]."
shared DynamicValue dynamicValueToCeylon(JDynamic dynamicValue, Anything(JNode,Node) update = noop) {
    value namedArgumentList = namedArgumentsToCeylon(dynamicValue.namedArgumentList, update);
    value dynamicModifier = DynamicModifier();
    update(dynamicValue, dynamicModifier);
    value result = DynamicValue(namedArgumentList.namedArguments, namedArgumentList.iterableArgument, dynamicModifier);
    update(dynamicValue, result);
    return result;
}

"Parses the given [[code]] for a Dynamic Value
 into a [[DynamicValue]] using the Ceylon compiler
 (more specifically, the rule for a `dynamicObject`)."
shared DynamicValue? parseDynamicValue(String code, Anything(JNode,Node) update = noop) {
    if (exists jDynamicObject = createParser(code).dynamicObject()) {
        return dynamicValueToCeylon(jDynamicObject, update);
    } else {
        return null;
    }
}
