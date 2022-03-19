import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/models/candidate_model.dart';
import 'package:prm_hmtif_unpas/services/candidate_service.dart';

class CandidateProvider with ChangeNotifier {
  List<CandidateModel> _candidate = [];

  List<CandidateModel> get candidates => _candidate;

  set candidates(List<CandidateModel> candidates) {
    _candidate = candidates;
    notifyListeners();
  }

  Future<void> getCandidates() async {
    try {
      List<CandidateModel> candidates =
          await CandidateService().getCandidates();
      _candidate = candidates;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getVotes() async {
    try {
      List<CandidateModel> candidates = await CandidateService().getVotes();
      _candidate = candidates;
    } catch (e) {
      print(e);
    }
  }
}
