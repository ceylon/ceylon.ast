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
    SingletonSet,
    TreeSet
}
import ceylon.test {
    test,
    assertEquals
}
import ceylon.ast.redhat {
    RedHatTransformer,
    SimpleTokenFactory
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
    InputStream,
    OutputStream,
    PrintStream
}
import java.lang {
    System
}
import ceylon.interop.java {
    JavaList
}
import com.redhat.ceylon.compiler.typechecker.context {
    PhasedUnit
}
import com.redhat.ceylon.model.typechecker.util {
    ModuleManager
}

String uncolor(String string)
        => string
            .replace("\e[31m", "")
            .replace("\e[32m", "")
            .replace("\e[33m", "")
            .replace("\e[34m", "")
            .replace("\e[0m", "");

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
    value scale = 2; // warning: scale ≥ 7 causes an OOME “GC overhead limit exceeded” when the typechecker tries to print the involved types
    value goodDriver = useTuringMachine("x".repeat(2 ^ scale), requiredIterations(2 ^ scale), "good");
    value badDriver = useTuringMachine("x".repeat(2^scale - 1), requiredIterations(2^scale - 1), "bad");
    
    /*
     Now we feed those compilation units into the typechecker.
     
     A big Thank You goes to Tako Schotanus, who helped me
     rig this up :)
     */
    
    value turingMachineRH = RedHatTransformer(SimpleTokenFactory()).transformCompilationUnit(turingMachine);
    value goodDriverRH = RedHatTransformer(SimpleTokenFactory()).transformCompilationUnit(goodDriver);
    value badDriverRH = RedHatTransformer(SimpleTokenFactory()).transformCompilationUnit(badDriver);
    
    object turingMachineFile satisfies VirtualFile {
        shared actual List<VirtualFile>? children => null;
        shared actual Boolean \iexists() => false;
        shared actual Boolean folder => false;
        shared actual InputStream? inputStream => null;
        shared actual String name => "turingMachine.ceylon";
        shared actual String path => "synthetic/turingMachine.ceylon";
        shared actual Integer compareTo(VirtualFile other) => 0;
        shared actual String getRelativePath(VirtualFile other) => "";
    }
    object goodDriverFile satisfies VirtualFile {
        shared actual List<VirtualFile>? children => null;
        shared actual Boolean \iexists() => false;
        shared actual Boolean folder => false;
        shared actual InputStream? inputStream => null;
        shared actual String name => "goodDriver.ceylon";
        shared actual String path => "synthetic/goodDriver.ceylon";
        shared actual Integer compareTo(VirtualFile other) => 0;
        shared actual String getRelativePath(VirtualFile other) => "";
    }
    object badDriverFile satisfies VirtualFile {
        shared actual List<VirtualFile>? children => null;
        shared actual Boolean \iexists() => false;
        shared actual Boolean folder => false;
        shared actual InputStream? inputStream => null;
        shared actual String name => "badDriver.ceylon";
        shared actual String path => "synthetic/badDriver.ceylon";
        shared actual Integer compareTo(VirtualFile other) => 0;
        shared actual String getRelativePath(VirtualFile other) => "";
    }
    object srcDir satisfies VirtualFile {
        shared actual List<VirtualFile>? children => JavaList<VirtualFile>([turingMachineFile, goodDriverFile, badDriverFile]);
        shared actual Boolean \iexists() => false;
        shared actual Boolean folder => true;
        shared actual InputStream? inputStream => null;
        shared actual String name => "synthetic";
        shared actual String path => "synthetic";
        shared actual Integer compareTo(VirtualFile other) => 0;
        shared actual String getRelativePath(VirtualFile other) => "";
    }
    
    TypeChecker tc = TypeCheckerBuilder().typeChecker;
    value context = tc.context;
    value moduleManager = ModuleManager();
    moduleManager.initCoreModules(context.modules);
    value pkg = context.modules.defaultModule.allVisiblePackages.get(0);
    value turingMachinePU = PhasedUnit(turingMachineFile, srcDir, turingMachineRH, pkg, moduleManager, null, context, null);
    value goodDriverPU = PhasedUnit(goodDriverFile, srcDir, goodDriverRH, pkg, moduleManager, null, context, null);
    value badDriverPU = PhasedUnit(badDriverFile, srcDir, badDriverRH, pkg, moduleManager, null, context, null);
    tc.phasedUnits.addPhasedUnit(turingMachineFile, turingMachinePU);
    tc.phasedUnits.addPhasedUnit(goodDriverFile, goodDriverPU);
    tc.phasedUnits.addPhasedUnit(badDriverFile, badDriverPU);
    
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
    } finally {
        System.setOut(sysOut);
        System.setErr(sysErr);
    }
    assertEquals {
        actual = tc.errors;
        expected = 1;
        message = "Typechecker errors";
    };
    value outString = uncolor(outSb.string);
    value errString = uncolor(errSb.string);
    assertEquals {
        actual = outString;
        expected = "1 errors, 0 warnings\n";
        message = "Typechecker standard output";
    };
    // the expected err line is ~1800 chars long, we’re not going to compare that :D
    assert (errString.startsWith("error [specified expression must be assignable to declared type of 'accept'"));
    assert (errString.contains("is not assignable to 'Accept'"));
}
