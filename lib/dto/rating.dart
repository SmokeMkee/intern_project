class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.count,
    this.rate,
  });

  factory Rating.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Rating();
    return Rating(rate: json["rate"], count: json["count"]);
  }
}
