import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/models/voting_time_model.dart';
import 'package:prm_hmtif_unpas/services/voting_time_service.dart';

class VotingTimeProvider with ChangeNotifier {
  late VotingTimeModel _votingTime;

  VotingTimeModel get votingTime => _votingTime;

  set votingTime(VotingTimeModel votingTime) {
    _votingTime = votingTime;
    notifyListeners();
  }

  Future<void> getVotingTime() async {
    try {
      VotingTimeModel votingTime = await VotingTimeService().getVotingTime();
      _votingTime = votingTime;
    } catch (e) {
      print(e);
    }
  }
}
