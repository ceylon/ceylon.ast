import ceylon.ast.samples.helloworld {
    helloWorldCompilationUnit,
    comExampleHelloworldModuleDescriptor,
    comExampleHelloworldPackageDescriptor
}
import ceylon.ast.core {
    AnyCompilationUnit,
    ModuleCompilationUnit,
    PackageCompilationUnit
}
import ceylon.ast.redhat {
    RedHatTransformer,
    TokenFactoryImpl
}
import ceylon.formatter {
    format
}
import ceylon.test {
    test,
    assertEquals,
    testSuite
}
import ceylon.collection {
    StringBuilder
}
import ceylon.file {
    Writer
}

void testFormatted(AnyCompilationUnit cu, String code) {
    StringBuilder sb = StringBuilder();
    format {
        cu.transform(RedHatTransformer(TokenFactoryImpl())); // TODO other TokenFactory impl that returns token stream and lets us pass it to formatter
        object output satisfies Writer {
            shared actual void close() {}
            shared actual void flush() {}
            shared actual void write(String string)
                    => sb.append(string);
            shared actual void writeBytes({Byte*} bytes) {
                throw AssertionError("Should not be used!");
            }
            shared actual void writeLine(String line) {
                throw AssertionError("Should not be used!");
            }
        }
    };
    assertEquals(sb.string, code + "\n");
}

testSuite ({ `function testFormattedModuleCU`, `function testFormattedPackageCU`, `function testFormattedHelloWorldCU` })
shared void testFormattedHelloWorld() {}

"Convert the [[hello world module descriptor|comExampleHelloworldModuleDescriptor]]
 to the RedHat AST, format it with the [[Ceylon formatter|module ceylon.formatter]],
 then compare the result to expected code."
test
void testFormattedModuleCU()
        => testFormatted {
    ModuleCompilationUnit(comExampleHelloworldModuleDescriptor);
    """module com.example.helloworld "1.0.0" {
       }""";
};

"Convert the [[hello world package descriptor|comExampleHelloworldPackageDescriptor]]
 to the RedHat AST, format it with the [[Ceylon formatter|module ceylon.formatter]],
 then compare the result to expected code."
test
void testFormattedPackageCU()
        => testFormatted {
    PackageCompilationUnit(comExampleHelloworldPackageDescriptor);
    """package com.example.helloworld;""";
};

"Convert the [[hello world compilation unit|helloWorldCompilationUnit]]
 to the RedHat AST, format it with the [[Ceylon formatter|module ceylon.formatter]],
 then compare the result to expected code."
test
void testFormattedHelloWorldCU()
        => testFormatted {
    helloWorldCompilationUnit;
    """void run() { print("Hello, `` process.arguments.first else "World" ``!"); }""";
};
