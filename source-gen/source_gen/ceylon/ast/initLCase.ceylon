String initLCase(String s) {
    if (exists first = s.first) {
        return String { first.lowercased, *s.rest };
    } else {
        return "";
    }
}
