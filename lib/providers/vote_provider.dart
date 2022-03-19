import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/models/vote_model.dart';
import 'package:prm_hmtif_unpas/services/vote_service.dart';

class VoteProvider with ChangeNotifier {
  List<VoteModel> _vote = [];

  List<VoteModel> get votes => _vote;

  set votes(List<VoteModel> votes) {
    _vote = votes;
    notifyListeners();
  }

  Future<bool> vote(String? token, int? userId, int? candidateId) async {
    try {
      if (await VoteService().vote(token, userId, candidateId)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
