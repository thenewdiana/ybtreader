function r(e) {
    function t(e) {
        var t = e.match(/(<a\b[^>]+>(.*?)<\/a>)/gi),
            n = [];
        if (e = "　　" + e.replace(/[ \u3000\t\r]/g, "").replace(/[\n]+/g, "\r\n　　"), t && t.length) {
            n = e.match(/(<a[^>]+>(.*?)<\/a>)/gi);
            for (var i = 0, a = n.length; a > i; i++) e = e.replace(n[i], t[i]);
        }
        return e;
    }
    for (var n = e.split("(\n\r)|(\n)"), i = null, a = 0, r = [], o = n.length; o > a; a++) {
        var i = n[a];
        r.push("" == i ? "\n\r" : t(i));
    }
    return r.join("");
}