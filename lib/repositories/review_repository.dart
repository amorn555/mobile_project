import 'dart:convert';

import 'package:public_toilets/models/review.dart';

import '../services/api_caller.dart';

class ReviewRepository {
  Future<List<Review>> getReviews() async {
    try {
      var result = await ApiCaller().get('reviews?_embed=toilets');
      List list = jsonDecode(result);
      List<Review> reviewList =
      list.map<Review>((item) => Review.fromJson(item)).toList();
      return reviewList;
    } catch (e) {
      // TODO:
      rethrow;
    }
  }

  Future<void> addReview(
      {required String name, required String review,required int rating}) async {
    try {
      var result = await ApiCaller()
          .post('reviews', params: {'name': name, 'review': review,'rating': rating});
    } catch (e) {
      // TODO:
      rethrow;
    }
  }
}
