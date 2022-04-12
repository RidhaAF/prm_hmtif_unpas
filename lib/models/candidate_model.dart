class CandidateModel {
  int? id;
  String? nrp;
  String? name;
  String? major;
  String? vision;
  String? mission;
  String? photo;
  num? voteResult;
  num? voteCount;

  CandidateModel({
    this.id,
    this.nrp,
    this.name,
    this.major,
    this.vision,
    this.mission,
    this.photo,
    this.voteResult,
    this.voteCount,
  });

  CandidateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nrp = json['nrp'];
    name = json['name'];
    major = json['major'];
    vision = json['vision'];
    mission = json['mission'];
    photo = json['photo'];
    voteResult = json['vote_result'];
    voteCount = json['vote_count'];
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
      'vote_result': voteResult,
      'vote_count': voteCount,
    };
  }
}
