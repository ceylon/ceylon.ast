import ceylon.ast.core {
    BaseType,
    QualifiedType,
    UIdentifier,
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
        nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Foo"), [BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing"), null))]);
    };
    shared String->QualifiedType stringDotFooOfNothingDotIterableOfStringQualifiedType
            = (stringDotFooOfNothingQualifiedType.key + "." + baseType.iterableOfStringType.key)->QualifiedType(stringDotFooOfNothingQualifiedType.item, baseType.iterableOfStringType.item.nameAndArgs);
    shared String->QualifiedType stringDotFooOfNothingDotIterableOfStringDotInnerQualifiedType
            = (stringDotFooOfNothingDotIterableOfStringQualifiedType.key + ".Inner")->QualifiedType(stringDotFooOfNothingDotIterableOfStringQualifiedType.item, TypeNameWithTypeArguments(UIdentifier("Inner")));
    
    shared actual QualifiedType? compile(String code) => compileQualifiedType(code);
    shared actual JQualifiedType fromCeylon(RedHatTransformer transformer)(QualifiedType node) => transformer.transformQualifiedType(node);
    shared actual QualifiedType toCeylon(JQualifiedType node) => qualifiedTypeToCeylon(node);
    codes = [stringDotFooOfNothingQualifiedType, stringDotFooOfNothingDotIterableOfStringQualifiedType, stringDotFooOfNothingDotIterableOfStringDotInnerQualifiedType];
}
