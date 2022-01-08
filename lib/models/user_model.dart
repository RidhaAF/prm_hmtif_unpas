class UserModel {
  int? id;
  String? nrp;
  String? name;
  String? username;
  String? email;
  String? password;
  String? roles;
  String? major;
  String? classYear;
  int? voteStatus;
  String? photo;
  String? profilePhotoUrl;
  String? token;

  UserModel({
    this.id,
    this.nrp,
    this.name,
    this.username,
    this.email,
    this.password,
    this.roles,
    this.major,
    this.classYear,
    this.voteStatus,
    this.photo,
    this.profilePhotoUrl,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nrp = json['nrp'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    roles = json['roles'];
    major = json['major'];
    classYear = json['class_year'];
    voteStatus = json['vote_status'];
    photo = json['photo'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nrp': nrp,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'roles': roles,
      'major': major,
      'class_year': classYear,
      'vote_status': voteStatus,
      'photo': photo,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
