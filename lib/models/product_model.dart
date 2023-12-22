class Products {
  int? id;
  DateTime? date;
  String title;
  int? credit;
  int? debit;
  double? total;
  String? thumbnail;
//  List<dynamic>? images;

  Products({
    required this.id,
    required this.title,
    required this.date,
    required this.credit,
    required this.debit,
    required this.total,
    required this.thumbnail,
//    this.images,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      credit: json['credit'],
      debit: json['debit'],
      total: json['total'],
      thumbnail: json['thumbnail'],
    );
  }
}
