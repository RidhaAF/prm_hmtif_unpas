import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/services/vote_service.dart';

class VoteProvider with ChangeNotifier {
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
