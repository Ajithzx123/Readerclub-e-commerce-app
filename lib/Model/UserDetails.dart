

// import 'dart:convert';

// UserDetails UserDetailsFromJson(json) => UserDetails.fromJson(json);

// String UserDetailsToJson(UserDetails data) => json.encode(data.toJson());

// class UserDetails {
//     UserDetails({
//         this.user,
//         this.accessToken,
//     });

//     User? user;
//     String? accessToken;

//     factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
//         user: User.fromJson(json["user"]),
//         accessToken: json["accessToken"],
//     );

//     Map<String, dynamic> toJson() => {
//         "user": user!.toJson(),
//         "accessToken": accessToken,
//     };
// }

// class User {
//     User({
//         this.id,
//         this.username,
//         this.name,
//         this.email,
//        this.mobile,
//         this.password,
//         this.wallet,
//         this.isAdmin,
//        this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//     });

//     String? id;
//     String? username;
//     String? name;
//     String? email;
//     String? mobile;
//     String? password;
//     String? wallet;
//     String? isAdmin;
//     String? status;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     String? v;

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["_id"],
//         username: json["username"],
//         name: json["name"],
//         email: json["email"],
//         mobile: json["mobile"],
//         password: json["password"],
//         wallet: json["wallet"],
//         isAdmin: json["isAdmin"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "username": username,
//         "name": name,
//         "email": email,
//         "mobile": mobile,
//         "password": password,
//         "wallet": wallet,
//         "isAdmin": isAdmin,
//         "status": status,
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "__v": v,
//     };
// }
