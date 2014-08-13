import ceylon.ast.core {
    ClassInstantiation,
    ExtendedType,
    TypeNameWithTypeArguments,
    PositionalArguments,
    Super,
    baseType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    extendedTypeToCeylon,
    compileExtendedType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExtendedType=ExtendedType
    }
}

shared object extendedType satisfies ConcreteTest<ExtendedType,JExtendedType> {
    
    String->ExtendedType construct(String->TypeNameWithTypeArguments name, String->PositionalArguments arguments, <String->Super>? qualifier = null)
            => "extends `` qualifier exists then "`` qualifier?.key else "" ``." else "" ````name.key````arguments.key``"->ExtendedType(ClassInstantiation(name.item, arguments.item, qualifier?.item));
    
    shared String->ExtendedType extendsNull = construct("Null"->baseType("Null").nameAndArgs, positionalArguments.emptyPositionalArguments);
    shared String->ExtendedType extendsSuperEntry
            = construct {
        value qualifier => \isuper.superSuper;
        name = "Entry<Key,Item>"->baseType("Entry", "Key", "Item").nameAndArgs;
        arguments = positionalArguments.keyItemPositionArguments;
    };
    
    compile = compileExtendedType;
    fromCeylon = RedHatTransformer.transformExtendedType;
    toCeylon = extendedTypeToCeylon;
    codes = [extendsNull, extendsSuperEntry];
}