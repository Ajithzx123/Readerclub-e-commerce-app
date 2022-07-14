class UserDetails {
  List<Dt>? dt;

  UserDetails({this.dt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    if (json['dt'] != null) {
      dt = <Dt>[];
      json['dt'].forEach((v) {
        dt!.add(new Dt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dt != null) {
      data['dt'] = this.dt!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dt {
  String? sId;
  String? userId;
  String? gender;
  String? proffession;
  String? dob;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Dt(
      {this.sId,
      this.userId,
      this.gender,
      this.proffession,
      this.dob,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Dt.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    gender = json['gender'];
    proffession = json['proffession'];
    dob = json['dob'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['gender'] = this.gender;
    data['proffession'] = this.proffession;
    data['dob'] = this.dob;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}