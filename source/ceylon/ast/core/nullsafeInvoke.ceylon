Return? nullsafeInvoke<in Argument,out Return>(Argument? argument, Return(Argument) fun) {
    if (exists argument) {
        return fun(argument);
    } else {
        return null;
    }
}
