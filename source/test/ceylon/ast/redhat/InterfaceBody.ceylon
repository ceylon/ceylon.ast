import ceylon.ast.core {
    Declaration,
    InterfaceBody,
    Specification
}
import ceylon.ast.redhat {
    RedHatTransformer,
    interfaceBodyToCeylon,
    parseInterfaceBody
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceBody=InterfaceBody
    }
}

shared object interfaceBody satisfies ConcreteTest<InterfaceBody,JInterfaceBody> {
    
    String->InterfaceBody construct(<String->Declaration|Specification>[] content)
            => "{``"".join(content*.key)``}"->InterfaceBody(content*.item);
    
    shared String->InterfaceBody emptyInterfaceBody = construct([]);
    shared String->InterfaceBody nonemptyInterfaceBody = construct([functionDeclaration.nonemptyFunctionDeclaration, lazySpecification.stringLazySpecification]);
    
    parse = parseInterfaceBody;
    fromCeylon = RedHatTransformer.transformInterfaceBody;
    toCeylon = interfaceBodyToCeylon;
    codes = [emptyInterfaceBody, nonemptyInterfaceBody];
}
