class CustomerStatus {
  final String id;
  final String status;

  CustomerStatus({required this.id, required this.status});

  factory CustomerStatus.fromJson(Map<String, dynamic> json) {
    return CustomerStatus(id: json["customer_id"], status: json["status"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': id,
      'status': status,
    };
  }
}
