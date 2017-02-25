import ceylon.ast.core {
    Declaration,
    Import,
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
    
    String->InterfaceBody construct(<String->Declaration|Specification>[] content, <String->Import>[] imports = [])
            => "{``"".join(concatenate(imports, content)*.key)``}" -> InterfaceBody(content*.item, imports*.item);
    
    shared String->InterfaceBody emptyInterfaceBody = construct([]);
    shared String->InterfaceBody nonemptyInterfaceBody = construct([functionDeclaration.nonemptyFunctionDeclaration, lazySpecification.stringLazySpecification]);
    shared String->InterfaceBody localImportsInterfaceBody = construct([], [\iimport.javaLangImport]);
    
    parse = parseInterfaceBody;
    fromCeylon = RedHatTransformer.transformInterfaceBody;
    toCeylon = interfaceBodyToCeylon;
    codes = [emptyInterfaceBody, nonemptyInterfaceBody, localImportsInterfaceBody];
}
