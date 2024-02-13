
class Meta {
  int perPage;
  int currentPage;
  int lastPage;
  int total;
  dynamic prev;
  dynamic next;

  Meta({
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.total,
    required this.prev,
    required this.next,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        perPage: json["perPage"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
        total: json["total"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "perPage": perPage,
        "currentPage": currentPage,
        "lastPage": lastPage,
        "total": total,
        "prev": prev,
        "next": next,
      };
}
