class AdoptionStatus {
  final String id;
  final String status;

  AdoptionStatus({required this.id, required this.status});

  factory AdoptionStatus.fromJson(Map<String, dynamic> json) {
    return AdoptionStatus(id: json["addoption_id"], status: json["status"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'addoption_id': id,
      'status': status,
    };
  }
}
