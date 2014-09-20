import ceylon.ast.core {
    DynamicValue
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamic=Dynamic
    }
}

"Converts a RedHat AST [[Dynamic|JDynamic]] to a `ceylon.ast` [[DynamicValue]]."
shared DynamicValue dynamicValueToCeylon(JDynamic dynamicValue) {
    value namedArgumentList = namedArgumentsToCeylon(dynamicValue.namedArgumentList);
    return DynamicValue(namedArgumentList.namedArguments, namedArgumentList.iterableArgument);
}

"Compiles the given [[code]] for a Dynamic Value
 into a [[DynamicValue]] using the Ceylon compiler
 (more specifically, the rule for a `dynamicObject`)."
shared DynamicValue? compileDynamicValue(String code) {
    if (exists jDynamicObject = createParser(code).dynamicObject()) {
        return dynamicValueToCeylon(jDynamicObject);
    } else {
        return null;
    }
}
