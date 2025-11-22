import 'job_detail_response.dart';

class JobListResponse {
  List<Jobs>? jobs;
  Meta? meta;

  JobListResponse({this.jobs, this.meta});

  JobListResponse.fromJson(Map<String, dynamic> json) {
    if (json['jobs'] != null) {
      jobs = <Jobs>[];
      json['jobs'].forEach((v) {
        jobs!.add(new Jobs.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Jobs {
  String? date;
  String? time;
  String? status;
  String? department;
  String? location;
  String? description;
  String? reference;
  String? service;
  int? sales;
  int? parts;
  int? payments;
  Customer? customer;

  Jobs({
    this.date,
    this.time,
    this.status,
    this.department,
    this.location,
    this.description,
    this.reference,
    this.sales,
    this.parts,
    this.payments,
    this.customer,
     this.service
  });

  Jobs.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    status = json['status'];
    department = json['department'];
    location = json['location'];
    description = json['description'];
    reference = json['reference'];
    sales = json['sales'];
    parts = json['parts'];
    payments = json['payments'];
    service= json['service'];
    customer = json['customer'] != null ? new Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['department'] = this.department;
    data['location'] = this.location;
    data['description'] = this.description;
    data['reference'] = this.reference;
    data['sales'] = this.sales;
    data['parts'] = this.parts;
    data['payments'] = this.payments;
    data['service']= this.service;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Meta {
  int? today;
  int? completed;

  Meta({this.today, this.completed});

  Meta.fromJson(Map<String, dynamic> json) {
    today = json['today'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['today'] = this.today;
    data['completed'] = this.completed;
    return data;
  }
}
