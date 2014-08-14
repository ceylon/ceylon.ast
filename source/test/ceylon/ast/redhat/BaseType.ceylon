import ceylon.ast.core {
    BaseType,
    UIdentifier,
    Type,
    TypeArgument,
    TypeNameWithTypeArguments,
    OutModifier,
    TypeArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    baseTypeToCeylon,
    compileBaseType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType
    }
}

shared object baseType satisfies ConcreteTest<BaseType,JBaseType> {
    
    String->BaseType construct(String name, [<String->Type>+]? args = null) {
        if (exists args) {
            return "``name``<``",".join(args.collect(Entry<String,Type>.key))``>"->BaseType(TypeNameWithTypeArguments(UIdentifier(name), TypeArguments(args.collect((String->Type entry) => TypeArgument(entry.item)))));
        } else {
            return name->BaseType(TypeNameWithTypeArguments(UIdentifier(name)));
        }
    }
    
    shared String->BaseType stringType = construct("String");
    shared String->BaseType iterableOfStringType = construct("Iterable", [stringType]);
    shared String->BaseType listOfOutObjectType = "List<out Object>"->BaseType(TypeNameWithTypeArguments {
            name = UIdentifier("List");
            typeArguments = TypeArguments([
                    TypeArgument {
                        type = BaseType(TypeNameWithTypeArguments(UIdentifier("Object")));
                        variance = OutModifier();
                    }
                ]);
        });
    
    // not tested directly, but used by other tests
    shared String->BaseType anythingType = construct("Anything");
    shared String->BaseType nothingType = construct("Nothing");
    shared String->BaseType integerType = construct("Integer");
    shared String->BaseType floatType = construct("Float");
    shared String->BaseType persistentType = construct("Persistent");
    shared String->BaseType printableType = construct("Printable");
    shared String->BaseType identifiableType = construct("Identifiable");
    shared String->BaseType characterType = construct("Character");
    
    compile = compileBaseType;
    fromCeylon = RedHatTransformer.transformBaseType; // TODO use shortcut refinement syntax when ceylon-compiler#1719 is fixed
    toCeylon = baseTypeToCeylon;
    codes = [stringType, iterableOfStringType, listOfOutObjectType];
}
