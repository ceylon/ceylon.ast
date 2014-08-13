import ceylon.ast.core {
    ClassInstantiation,
    ClassSpecifier,
    PositionalArguments,
    Super,
    TypeNameWithTypeArguments,
    baseType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    classSpecifierToCeylon,
    compileClassSpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassSpecifier=ClassSpecifier
    }
}

shared object classSpecifier satisfies ConcreteTest<ClassSpecifier,JClassSpecifier> {
    
    String->ClassSpecifier construct(String->TypeNameWithTypeArguments name, String->PositionalArguments arguments, <String->Super>? qualifier = null)
            => "=> `` qualifier exists then "`` qualifier?.key else "" ``." else "" ````name.key````arguments.key``"->ClassSpecifier(ClassInstantiation(name.item, arguments.item, qualifier?.item));
    
    shared String->ClassSpecifier classSpecifyStringCharacters = construct("String"->baseType("String").nameAndArgs, positionalArguments.spreadTextPositionalArguments);
    shared String->ClassSpecifier classSpecifySuperEntry
            = construct {
        value qualifier => \isuper.superSuper;
        name = "Entry<Key,Item>"->baseType("Entry", "Key", "Item").nameAndArgs;
        arguments = positionalArguments.keyItemPositionArguments;
    };
    
    compile = compileClassSpecifier;
    fromCeylon = RedHatTransformer.transformClassSpecifier;
    toCeylon = classSpecifierToCeylon;
    codes = [classSpecifyStringCharacters, classSpecifySuperEntry];
}
