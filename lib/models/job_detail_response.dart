class JobDetailResponse {
  Job? job;

  JobDetailResponse({this.job});

  JobDetailResponse.fromJson(Map<String, dynamic> json) {
    job = json['job'] != null ? new Job.fromJson(json['job']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }
    return data;
  }
}

class Job {
  String? reference;
  String? department;
  String? status;
  String? type;
  String? service;
  String? location;
  Customer? customer;
  String? leadType;

  Job({this.reference, this.department, this.status, this.type, this.service, this.location, this.customer, this.leadType});

  Job.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    department = json['department'];
    status = json['status'];
    type = json['type'];
    service = json['service'];
    location = json['location'];
    leadType = json["lead_type"];
    customer = json['customer'] != null ? new Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = this.reference;
    data['department'] = this.department;
    data['status'] = this.status;
    data['type'] = this.type;
    data['service'] = this.service;
    data['location'] = this.location;
    data['lead_type'] = this.leadType;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? name;
  String? date;
  String? phone;
  String? email;
  String? location;

  Customer({this.name, this.date, this.phone, this.email, this.location});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    phone = json['phone'];
    email = json['email'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['location'] = this.location;
    return data;
  }
}
