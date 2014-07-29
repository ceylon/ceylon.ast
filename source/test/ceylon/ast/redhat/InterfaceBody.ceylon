import ceylon.ast.core {
    Declaration,
    InterfaceBody
}
import ceylon.ast.redhat {
    RedHatTransformer,
    interfaceBodyToCeylon,
    compileInterfaceBody
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceBody=InterfaceBody
    }
}

shared object interfaceBody satisfies ConcreteTest<InterfaceBody,JInterfaceBody> {
    
    String->InterfaceBody construct(<String->Declaration>[] content)
            => "{``"".join(content*.key)``}"->InterfaceBody(content*.item);
    
    shared String->InterfaceBody emptyInterfaceBody = construct([]);
    
    compile = compileInterfaceBody;
    fromCeylon = RedHatTransformer.transformInterfaceBody;
    toCeylon = interfaceBodyToCeylon;
    codes = [emptyInterfaceBody];
}
