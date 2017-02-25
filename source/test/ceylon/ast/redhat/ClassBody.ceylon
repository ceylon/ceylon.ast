import ceylon.ast.core {
    ClassBody,
    Declaration,
    Import,
    Statement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    classBodyToCeylon,
    parseClassBody
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassBody=ClassBody
    }
}

shared object classBody satisfies ConcreteTest<ClassBody,JClassBody> {
    
    String->ClassBody construct(<String->Declaration|Statement>[] content, <String->Import>[] imports = [])
            => "{``"".join(concatenate(imports, content)*.key)``}" -> ClassBody(content*.item, imports*.item);
    
    shared String->ClassBody emptyClassBody = construct([]);
    shared String->ClassBody pointClassBody = construct([
            valueDeclaration.sharedFloatXDeclaration,
            valueDeclaration.sharedFloatYDeclaration,
            valueDeclaration.sharedFloatRDeclaration,
            valueDeclaration.sharedFloatPhiDeclaration,
            callableConstructorDefinition.cartesianConstructorDefinition,
            callableConstructorDefinition.polarConstructorDefinition,
            valueConstructorDefinition.originValueConstructorDefinition,
            valueDefinition.stringDefinition
        ]);
    shared String->ClassBody localImportsClassBody = construct([], [\iimport.javaLangImport]);
    
    parse = parseClassBody;
    fromCeylon = RedHatTransformer.transformClassBody;
    toCeylon = classBodyToCeylon;
    codes = [emptyClassBody, pointClassBody, localImportsClassBody];
}
