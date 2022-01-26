class UserModel {
  int id;
  String namalengkap;
  String email;
  String nip;
  String token;

  UserModel({this.email, this.id, this.namalengkap, this.nip, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namalengkap = json['namalengkap'];
    email = json['email'];
    nip = json['nip'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'namalengkap': namalengkap,
      'email': email,
      'nip': nip,
      'token': token
    };
  }
}
