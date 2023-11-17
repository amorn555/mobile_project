import 'package:flutter/material.dart';
import 'package:public_toilets/repositories/review_repository.dart';

class AddReviewPage extends StatefulWidget {
  static const routeName = 'add_review';

  const AddReviewPage({super.key});

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  var _isLoading = false;
  String? _errorMessage;
  final _toiletNameController = TextEditingController();
  final _reviewController = TextEditingController();
  final _ratingController = TextEditingController();

  validateForm() {
    return _toiletNameController.text.isNotEmpty &&
        _reviewController.text.isNotEmpty &&
        _ratingController.text.isNotEmpty;
  }

  saveReview() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(Duration(seconds: 2));

    try {
      var toiletName = _toiletNameController.text;
      var review = _reviewController.text;
      var rating = int.parse(_ratingController.text);

      await ReviewRepository()
          .addReview(name: toiletName, review: review, rating: rating);
      if (mounted) Navigator.pop(context);
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    buildLoadingOverlay() => Container(
        color: Colors.black.withOpacity(0.2),
        child: Center(child: CircularProgressIndicator()));

    handleClickSave() {
      if (validateForm()) {
        saveReview();
      }
    }

    buildForm() => SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: _toiletNameController,
                      decoration: InputDecoration(
                          hintText: 'Toilet name',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.greenAccent,
                          )))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: _reviewController,
                      decoration: InputDecoration(
                          hintText: 'review',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.greenAccent,
                          )))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: _ratingController,
                      decoration: InputDecoration(
                          hintText: 'rating',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.greenAccent,
                          )))),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: handleClickSave,
                      child: Text('SAVE'),
                    ))
              ],
            )));

    return Scaffold(
      appBar: AppBar(title: Text('ADD REVIEW')),
      body: Stack(
        children: [
          buildForm(),
          if (_isLoading) buildLoadingOverlay(),
        ],
      ),
    );
  }
}
