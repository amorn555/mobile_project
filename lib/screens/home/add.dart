import 'package:flutter/material.dart';
import 'package:public_toilets/screens/home/add_review.dart';
import 'package:public_toilets/screens/home/add_toilet.dart';

class AddPage extends StatefulWidget {
  static const routeName = 'add';

  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Public Toilets'))),
      body: Ink(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AddToiletPage.routeName);
                },
                borderRadius: BorderRadius.circular(20),
                splashColor: Colors.black.withOpacity(0.1),
                hoverColor: Colors.black.withOpacity(0.2),
                highlightColor: Colors.black.withOpacity(0.12),
                child: Ink(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.black,
                      )),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Toilet',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AddReviewPage.routeName);
                  },
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.black.withOpacity(0.1),
                  hoverColor: Colors.black.withOpacity(0.2),
                  highlightColor: Colors.black.withOpacity(0.12),
                  child: Ink(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueGrey,
                        border: Border.all(
                          color: Colors.black,
                        )),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Review',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
