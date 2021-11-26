class CandidateModel {
  int? id;
  String? nrp;
  String? name;
  String? major;
  String? vision;
  String? mission;
  String? photo;

  CandidateModel({
    this.id,
    this.nrp,
    this.name,
    this.major,
    this.vision,
    this.mission,
    this.photo,
  });

  CandidateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nrp = json['nrp'];
    name = json['name'];
    major = json['major'];
    vision = json['vision'];
    mission = json['mission'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nrp': nrp,
      'name': name,
      'major': major,
      'vision': vision,
      'mission': mission,
      'photo': photo,
    };
  }
}
