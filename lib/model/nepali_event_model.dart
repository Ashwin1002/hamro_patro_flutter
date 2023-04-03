class NepaliYearDataModel {
  NepaliYearDataModel({
    required this.yearLst,
  });

  final List<Map<String, List<YearLst>>> yearLst;

  factory NepaliYearDataModel.fromJson(Map<String, dynamic> json){
    return NepaliYearDataModel(
      yearLst: json["yearLst"] == null ? [] : List<Map<String, List<YearLst>>>.from(json["yearLst"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, List<YearLst>>(k, v == null ? [] : List<YearLst>.from(v!.map((x) => YearLst.fromJson(x))))))),
    );
  }

  Map<String, dynamic> toJson() => {
    "yearLst": yearLst.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.map((x) => x?.toJson()).toList()))).toList(),
  };

}

class YearLst {
  YearLst({
    required this.metadata,
    required this.days,
    required this.holiFest,
    required this.marriage,
    required this.bratabandha,
  });

  final Metadata? metadata;
  final List<Day> days;
  final List<String> holiFest;
  final List<String> marriage;
  final List<String> bratabandha;

  factory YearLst.fromJson(Map<String, dynamic> json) {
    return YearLst(
      metadata:
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      days: json["days"] == null
          ? []
          : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
      holiFest: json["holiFest"] == null
          ? []
          : List<String>.from(json["holiFest"]!.map((x) => x)),
      marriage: json["marriage"] == null
          ? []
          : List<String>.from(json["marriage"]!.map((x) => x)),
      bratabandha: json["bratabandha"] == null
          ? []
          : List<String>.from(json["bratabandha"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "days": days.map((x) => x.toJson()).toList(),
        "holiFest": holiFest.map((x) => x).toList(),
        "marriage": marriage.map((x) => x).toList(),
        "bratabandha": bratabandha.map((x) => x).toList(),
      };
}

class Day {
  Day({
    required this.nepaliDate,
    required this.englishDate,
    required this.tithi,
    required this.festival,
    required this.isHoliday,
    required this.weekDay,
  });

  final String nepaliDate;
  final String englishDate;
  final String tithi;
  final String festival;
  final bool isHoliday;
  final int weekDay;

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      nepaliDate: json["n"] ?? "",
      englishDate: json["e"] ?? "",
      tithi: json["t"] ?? "",
      festival: json["f"] ?? "",
      isHoliday: json["h"] ?? false,
      weekDay: json["d"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "n": nepaliDate,
        "e": englishDate,
        "t": tithi,
        "f": festival,
        "h": isHoliday,
        "d": weekDay,
      };
}

class Metadata {
  Metadata({
    required this.en,
    required this.np,
  });

  final String en;
  final String np;

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      en: json["en"] ?? "",
      np: json["np"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
