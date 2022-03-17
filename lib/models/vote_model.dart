class VoteModel {
  int? id;
  String? userId;
  String? candidateId;
  double? voteResult;

  VoteModel({
    this.id,
    this.userId,
    this.candidateId,
    this.voteResult,
  });

  VoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    candidateId = json['candidate_id'];
    voteResult = json['vote_result'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'candidate_id': candidateId,
      'vote_result': voteResult,
    };
  }
}
