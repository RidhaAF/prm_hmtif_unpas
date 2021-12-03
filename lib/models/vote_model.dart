class VoteModel {
  int? id;
  String? userId;
  String? candidateId;

  VoteModel({
    this.id,
    this.userId,
    this.candidateId,
  });

  VoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    candidateId = json['candidate_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'candidate_id': candidateId,
    };
  }
}
