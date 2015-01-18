import ceylon.ast.core {
    ClassInstantiation,
    ExtendedType,
    TypeNameWithTypeArguments,
    PositionalArguments,
    Super,
    UIdentifier
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
import ceylon.ast.create {
    baseType
}

shared object extendedType satisfies ConcreteTest<ExtendedType,JExtendedType> {
    
    String->ExtendedType construct(String->TypeNameWithTypeArguments name, String->PositionalArguments arguments, <String->TypeNameWithTypeArguments|Super>? qualifier = null)
            => "extends `` qualifier exists then "`` qualifier?.key else "" ``." else "" ````name.key````arguments.key``"->ExtendedType(ClassInstantiation(name.item, arguments.item, qualifier?.item));
    
    shared String->ExtendedType extendsNull = construct("Null"->baseType("Null").nameAndArgs, positionalArguments.emptyPositionalArguments);
    shared String->ExtendedType extendsSuperEntry
            = construct {
        value qualifier => \isuper.superSuper;
        name = "Entry<Key,Item>"->baseType("Entry", "Key", "Item").nameAndArgs;
        arguments = positionalArguments.keyItemPositionArguments;
    };
    shared String->ExtendedType extendsHomCoordCart
            = construct {
        qualifier = "HomogenousCoordinates"->TypeNameWithTypeArguments(UIdentifier("HomogenousCoordinates"));
        name = "Cartesian"->TypeNameWithTypeArguments(UIdentifier("Cartesian"));
        arguments = positionalArguments.abcPositionalArguments;
    };
    
    // not tested directly, but used by other tests
    shared String->ExtendedType extendsAnything = construct("Anything"->baseType("Anything").nameAndArgs, positionalArguments.emptyPositionalArguments);
    
    compile = compileExtendedType;
    fromCeylon = RedHatTransformer.transformExtendedType;
    toCeylon = extendedTypeToCeylon;
    codes = [extendsNull, extendsSuperEntry, extendsHomCoordCart];
}
