import ceylon.ast.samples.turingMachine {
    createTuringMachine,
    useTuringMachine,
    Movement,
    left,
    none,
    right,
    IllegalStateException,
    IllegalSymbolException
}
import ceylon.collection {
    LinkedList,
    SingletonSet,
    TreeSet
}
import ceylon.test {
    test,
    assertEquals
}
import ceylon.file {
    Writer
}
import ceylon.formatter {
    format
}
import ceylon.ast.redhat {
    RedHatTransformer,
    TokenFactoryImpl
}
import com.redhat.ceylon.compiler.typechecker {
    TypeCheckerBuilder,
    TypeChecker
}
import com.redhat.ceylon.compiler.typechecker.io {
    VirtualFile
}
import java.util {
    List
}
import java.io {
    ByteArrayInputStream,
    InputStream,
    OutputStream,
    PrintStream
}
import java.lang {
    JString=String,
    System
}
import ceylon.interop.java {
    JavaList
}

"Tests the Type System Turing Machine
 with a TM that tests if the input length is a power of two."
test
shared void powerOfTwo() {
    
    Integer log2_ceil(variable Integer num) {
        variable Integer ret = 0;
        while (num > 1) {
            num /= 2;
            ret++;
        }
        return ret;
    }
    Integer requiredIterations(Integer wordLength)
            => (2 * (wordLength + 1)) // scan forward and backward (plus blank on each side)
            * log2_ceil(wordLength) // until the word is fully reduced (log2(n) divisions)
            + wordLength + 1; // then scan right to the end (plus blank) to see that we really have only one symbol left
    
    value turingMachine = createTuringMachine {
        states = TreeSet { byIncreasing(identity<String>); "Trash", "Start", "AfterFirst", "Even", "Odd", "Rewind", "Accept" };
        acceptingStates = TreeSet { byIncreasing(identity<String>); "Accept" };
        initialState = "Start";
        symbols = TreeSet { byIncreasing(identity<Character>); 'x', 'y' };
        inputSymbols = SingletonSet('x');
        [String, Character, Movement] transition(String state, Character symbol) {
            value trash = ["Trash", symbol, none];
            
            switch (state)
            case ("Trash") { return trash; }
            case ("Start") {
                switch (symbol)
                case ('x') { return ["AfterFirst", 'x', right]; }
                case ('y') { return trash; }
                case ('_') { return ["Accept", '_', none]; }
                else { throw IllegalSymbolException(symbol); }
            }
            case ("AfterFirst") {
                switch (symbol)
                case ('x') { return ["Even", 'y', right]; }
                case ('y') { return ["AfterFirst", 'y', right]; }
                case ('_') { return ["Accept", '_', none]; }
                else { throw IllegalSymbolException(symbol); }
            }
            case ("Even") {
                switch (symbol)
                case ('x') { return ["Odd", 'x', right]; }
                case ('y') { return ["Even", 'y', right]; }
                case ('_') { return ["Rewind", '_', left]; }
                else { throw IllegalSymbolException(symbol); }
            }
            case ("Odd") {
                switch (symbol)
                case ('x') { return ["Even", 'y', right]; }
                case ('y') { return ["Odd", 'y', right]; }
                case ('_') { return trash; }
                else { throw IllegalSymbolException(symbol); }
            }
            case ("Rewind") {
                switch (symbol)
                case ('x' | 'y') { return ["Rewind", symbol, left]; }
                case ('_') { return ["Start", symbol, right]; }
                else { throw IllegalSymbolException(symbol); }
            }
            case ("Accept") {
                return ["Accept", symbol, none];
            }
            else { throw IllegalStateException(state); }
        }
    };
    value scale = 3;
    value goodDriver = useTuringMachine("x".repeat(2 ^ scale), requiredIterations(2 ^ scale), "good");
    value badDriver = useTuringMachine("x".repeat(2 ^ scale - 1), requiredIterations(2 ^ scale - 1), "bad");
    
    /*
     Here comes the ugly part.
     
     We’ll typecheck the turing machine + drivers
     and assert that there’s exactly one error
     (when assigning to ‘Accept accept’ in the bad driver).
     However, calling the typechecker isn’t exactly easy…
     
     What we do here is write the units to three strings,
     construct virtual files that read from these strings
     (plus a virtual directory containing them),
     then feed that virtual directory into the typechecker.
     To check the typechecker’s output, we capture stdout and stderr.
     
     The main smell here is that we format the compilation units
     just so the typechecker can immediately parse them again.
     It would be a lot better if we could pass compilation units
     to the typechecker directly, but I couldn’t figure out
     a way to do this.
     
     A big Thank You goes to Tako Schotanus, who helped me
     rig up this thing :)
     */
    
    value turingMachineSb = StringBuilder();
    format {
        turingMachine.transform(RedHatTransformer(TokenFactoryImpl()));
        output = StringBuilderWriter(turingMachineSb);
    };
    value goodDriverSb = StringBuilder();
    format {
        goodDriver.transform(RedHatTransformer(TokenFactoryImpl()));
        output = StringBuilderWriter(goodDriverSb);
    };
    value badDriverSb = StringBuilder();
    format {
        badDriver.transform(RedHatTransformer(TokenFactoryImpl()));
        output = StringBuilderWriter(badDriverSb);
    };
    
    TypeCheckerBuilder tcb = TypeCheckerBuilder();
    object turingMachineFile satisfies VirtualFile {
        shared actual List<VirtualFile>? children => null;
        shared actual Boolean folder => false;
        shared actual InputStream? inputStream => ByteArrayInputStream(JString(turingMachineSb.string).bytes);
        shared actual String name => "turingMachine.ceylon";
        shared actual String path => "synthetic/turingMachine.ceylon";
    }
    object goodDriverFile satisfies VirtualFile {
        shared actual List<VirtualFile>? children => null;
        shared actual Boolean folder => false;
        shared actual InputStream? inputStream => ByteArrayInputStream(JString(goodDriverSb.string).bytes);
        shared actual String name => "goodDriver.ceylon";
        shared actual String path => "synthetic/goodDriver.ceylon";
    }
    object badDriverFile satisfies VirtualFile {
        shared actual List<VirtualFile>? children => null;
        shared actual Boolean folder => false;
        shared actual InputStream? inputStream => ByteArrayInputStream(JString(badDriverSb.string).bytes);
        shared actual String name => "badDriver.ceylon";
        shared actual String path => "synthetic/badDriver.ceylon";
    }
    object srcDir satisfies VirtualFile {
        shared actual List<VirtualFile>? children => JavaList(LinkedList<VirtualFile> { turingMachineFile, goodDriverFile, badDriverFile });
        shared actual Boolean folder => true;
        shared actual InputStream? inputStream => null;
        shared actual String name => "synthetic";
        shared actual String path => "synthetic";
    }
    tcb.addSrcDirectory(srcDir);
    TypeChecker tc = tcb.typeChecker;
    value sysOut = System.\iout;
    value sysErr = System.err;
    value outSb = StringBuilder();
    value errSb = StringBuilder();
    object os extends OutputStream() {
        shared actual void write(Integer int) {
            throw AssertionError("Shouldn’t write to this");
        }
    }
    object newOut extends PrintStream(os) {
        shared actual void println(String line) {
            outSb.append(line);
            outSb.appendNewline();
        }
    }
    object newErr extends PrintStream(os) {
        shared actual void println(String line) {
            errSb.append(line);
            errSb.appendNewline();
        }
    }
    try {
        System.setOut(newOut);
        System.setErr(newErr);
        
        tc.process();
        assertEquals {
            actual = tc.errors;
            expected = 1;
            message = "Typechecker errors";
        };
        assertEquals {
            actual = outSb.string;
            expected = "1 errors, 0 warnings\n";
            message = "Typechecker standard output";
        };
        // the expected err line is ~1800 chars long, we’re not going to compare that :D
        assert (errSb.string.startsWith("error [specified expression must be assignable to declared type of 'accept':"));
        assert (errSb.string.contains("is not assignable to 'Accept']"));
    } finally {
        System.setOut(sysOut);
        System.setErr(sysErr);
    }
}

class StringBuilderWriter(StringBuilder sb) satisfies Writer {
    shared actual void close() => flush();
    shared actual void flush() {}
    shared actual void write(String string) => sb.append(string);
    shared actual void writeBytes({Byte*} bytes) {
        throw AssertionError("May not write bytes");
    }
    shared actual void writeLine(String line) {
        sb.append(line);
        sb.appendNewline();
    }
}
