class UserModel {
  int? id;
  String? nrp;
  String? name;
  String? email;
  String? major;
  String? classYear;
  String? profilePhotoUrl;
  String? token;

  UserModel({
    this.id,
    this.nrp,
    this.name,
    this.email,
    this.major,
    this.classYear,
    this.profilePhotoUrl,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nrp = json['nrp'];
    name = json['name'];
    email = json['email'];
    major = json['major'];
    classYear = json['class_year'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nrp': nrp,
      'name': name,
      'email': email,
      'major': major,
      'class_year': classYear,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
