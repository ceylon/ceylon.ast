import ceylon.ast.core {
    BaseType,
    QualifiedType,
    UIdentifier,
    TypeArgument,
    TypeNameWithTypeArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    qualifiedTypeToCeylon,
    compileQualifiedType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JQualifiedType=QualifiedType
    }
}

shared object qualifiedType satisfies ConcreteTest<QualifiedType,JQualifiedType> {
    shared String->QualifiedType stringDotFooOfNothingQualifiedType
            = "String.Foo<Nothing>"->QualifiedType {
        qualifyingType = baseType.stringType.item;
        nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Foo"), [TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing"), null)))]);
    };
    shared String->QualifiedType stringDotFooOfNothingDotIterableOfStringQualifiedType
            = (stringDotFooOfNothingQualifiedType.key + "." + baseType.iterableOfStringType.key)->QualifiedType(stringDotFooOfNothingQualifiedType.item, baseType.iterableOfStringType.item.nameAndArgs);
    shared String->QualifiedType stringDotFooOfNothingDotIterableOfStringDotInnerQualifiedType
            = (stringDotFooOfNothingDotIterableOfStringQualifiedType.key + ".Inner")->QualifiedType(stringDotFooOfNothingDotIterableOfStringQualifiedType.item, TypeNameWithTypeArguments(UIdentifier("Inner")));
    
    compile = compileQualifiedType;
    fromCeylon = RedHatTransformer.transformQualifiedType;
    toCeylon = qualifiedTypeToCeylon;
    codes = [stringDotFooOfNothingQualifiedType, stringDotFooOfNothingDotIterableOfStringQualifiedType, stringDotFooOfNothingDotIterableOfStringDotInnerQualifiedType];
}
