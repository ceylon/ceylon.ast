import ceylon.ast.core {
    ClassBody,
    Declaration,
    Statement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    classBodyToCeylon,
    compileClassBody
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassBody=ClassBody
    }
}

shared object classBody satisfies ConcreteTest<ClassBody,JClassBody> {
    
    String->ClassBody construct(<String->Declaration|Statement>[] content)
            => "{``"".join(content*.key)``}"->ClassBody(content*.item);
    
    shared String->ClassBody emptyClassBody = construct([]);
    shared String->ClassBody pointClassBody = construct([
            valueDeclaration.sharedFloatXDeclaration,
            valueDeclaration.sharedFloatYDeclaration,
            valueDeclaration.sharedFloatRDeclaration,
            valueDeclaration.sharedFloatPhiDeclaration,
            constructorDefinition.cartesianConstructorDefinition,
            constructorDefinition.polarConstructorDefinition,
            valueDefinition.stringDefinition
        ]);
    
    compile = compileClassBody;
    fromCeylon = RedHatTransformer.transformClassBody;
    toCeylon = classBodyToCeylon;
    codes = [emptyClassBody, pointClassBody];
}
