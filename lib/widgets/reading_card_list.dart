import 'package:books_app/constants.dart';
import 'package:flutter/material.dart';

class Readingcard extends StatelessWidget {
  final String imSrc;
  final String Name;
  final String Author;
  final double Rating;
  final VoidCallback pressDetails;
  final VoidCallback pressRead;

  const Readingcard({
    Key? key,
    required this.imSrc,
    required this.Name,
    required this.Author,
    required this.Rating,
    required this.pressDetails,
    required this.pressRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 202,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 221,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            imSrc,
            width: 150,
          ),
          Positioned(
            top: 35,
            right: 10,
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                bookRating(
                  score: Rating,
                ),
              ],
            ),
          ),
          Positioned(
              top: 160,
              child: Container(
                height: 90,
                width: 202,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: kBlackColor),
                          children: [
                            TextSpan(
                              text: "$Name\n",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: Author,
                              style: TextStyle(color: kLightBlackColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: pressDetails,
                          child: Container(
                            width: 101,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            alignment: Alignment.center,
                            child: Text("Details"),
                          ),
                        ),
                        twosidebtn(pressRead: pressRead),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class twosidebtn extends StatelessWidget {
  const twosidebtn({
    Key? key,
    required this.pressRead,
  }) : super(key: key);

  final Function pressRead;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressRead(),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(29),
            bottomRight: Radius.circular(29),
          ),
        ),
        child: Text(
          "Read",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class bookRating extends StatelessWidget {
  final double score;
  const bookRating({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 7),
            blurRadius: 20,
            color: Color(0xFD3D3D3).withOpacity(.5),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.star,
            color: kIconColor,
            size: 15,
          ),
          SizedBox(height: 5),
          Text(
            "$score",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
