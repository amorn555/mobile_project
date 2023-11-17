import 'dart:convert';

import 'package:public_toilets/models/toilet.dart';

import '../services/api_caller.dart';

class ToiletRepository {
  Future<List<Toilet>> getToilets() async {
    try {
      var result = await ApiCaller().get('toilets?_embed=reviews');
      List list = jsonDecode(result);
      List<Toilet> toiletList =
          list.map<Toilet>((item) => Toilet.fromJson(item)).toList();
      return toiletList;
    } catch (e) {
      // TODO:
      rethrow;
    }
  }

    Future<void> addToilet(
      {required String name, required double distance}) async {
    try {
      var result = await ApiCaller()
          .post('toilets', params: {'name': name, 'distance': distance});
    } catch (e) {
      // TODO:
      rethrow;
    }
  }
}
