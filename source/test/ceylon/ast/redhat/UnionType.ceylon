import ceylon.test {
    test
}
import ceylon.ast.api {
    BaseType,
    IntersectionType,
    TypeNameWithArguments,
    UIdentifier,
    UnionType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unionTypeToCeylon,
    compile=compileUnionType
}

test
shared void unionType()
        => doTest(compile, RedHatTransformer.transformUnionType, unionTypeToCeylon,
    "String|Integer|Float"->UnionType([
            BaseType(TypeNameWithArguments(UIdentifier("String"))),
            BaseType(TypeNameWithArguments(UIdentifier("Integer"))),
            BaseType(TypeNameWithArguments(UIdentifier("Float")))
        ])
    /*, // TODO re-enable this beautiful test that’s broken by ceylon/ceylon-compiler#1695 :(
        // from https://github.com/lucaswerkmeister/ceylon-typesystem-turing-complete/blob/eca01e028b71a8272480d16663f7e603be7a2fd8/source/ceylon/typesystem/demo/notDivisibleByThree/automaton.ceylon#L62
        " |\n".join {
            for (i in 0..2)
                for (j in 0..2)
                    "S&Q``i``&C&R``j``&B<Q`` (i + j) % 3 ``>"
        }->UnionType {
            children = [
                for (i in 0..2)
                    for (j in 0..2)
                        IntersectionType {
                            children = [
                                BaseType(TypeNameWithArguments(UIdentifier("S"))),
                                BaseType(TypeNameWithArguments(UIdentifier("Q``i``"))),
                                BaseType(TypeNameWithArguments(UIdentifier("C"))),
                                BaseType(TypeNameWithArguments(UIdentifier("R``j``"))),
                                BaseType(TypeNameWithArguments(UIdentifier("B"), [BaseType(TypeNameWithArguments(UIdentifier("Q`` (i + j) % 3 ``")))]))
                            ];
                        }
            ];
        }*/
);
