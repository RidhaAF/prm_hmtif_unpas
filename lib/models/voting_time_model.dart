class VotingTimeModel {
  String? startTime;
  String? endTime;

  VotingTimeModel({
    this.startTime,
    this.endTime,
  });

  VotingTimeModel.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}
