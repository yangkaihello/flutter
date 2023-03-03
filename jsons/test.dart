// To parse this JSON data, do
//
//     final test = testFromJson(jsonString);

import 'dart:convert';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
    Test({
        required this.a,
        required this.b,
        required this.c,
        required this.test,
    });

    String a;
    List<List<int>> b;
    C c;
    List<dynamic> test;

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        a: json["a"],
        b: List<List<int>>.from(json["b"].map((x) => List<int>.from(x.map((x) => x)))),
        c: C.fromJson(json["c"]),
        test: List<dynamic>.from(json["test"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "a": a,
        "b": List<dynamic>.from(b.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "c": c.toJson(),
        "test": List<dynamic>.from(test.map((x) => x)),
    };
}

class C {
    C({
        required this.d,
    });

    List<D> d;

    factory C.fromJson(Map<String, dynamic> json) => C(
        d: List<D>.from(json["d"].map((x) => D.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "d": List<dynamic>.from(d.map((x) => x.toJson())),
    };
}

class D {
    D({
        required this.e,
    });

    List<int> e;

    factory D.fromJson(Map<String, dynamic> json) => D(
        e: List<int>.from(json["e"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "e": List<dynamic>.from(e.map((x) => x)),
    };
}

class PurpleTest {
    PurpleTest({
        this.test4,
        this.test6,
    });

    String? test4;
    String? test6;

    factory PurpleTest.fromJson(Map<String, dynamic> json) => PurpleTest(
        test4: json["test4"],
        test6: json["test6"],
    );

    Map<String, dynamic> toJson() => {
        "test4": test4,
        "test6": test6,
    };
}

class FluffyTest {
    FluffyTest({
        required this.test2,
    });

    String test2;

    factory FluffyTest.fromJson(Map<String, dynamic> json) => FluffyTest(
        test2: json["test2"],
    );

    Map<String, dynamic> toJson() => {
        "test2": test2,
    };
}
