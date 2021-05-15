import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[makeSlide(), newReleases()],
    );
  }

  Widget makeSlide() {
    return Container(
      child: Text('Slider'),
    );
  }

  Widget newReleases() {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 400,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          drawCard("Moamel Strong", "this film is aer"),
          drawCard("Moamel2 Strong", "this film is aer"),
          drawCard("Moamel2 Strong", "this film is aer"),
          drawCard("Moamel2 Strong", "this film is aer"),
          drawCard("Moamel2 Strong", "this film is aer"),
        ],
      ),
    );
  }

  Widget drawCard(String title, String subtitle) {
    return
      Container(
        margin: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12, 
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _drawImage(),
              _drawTitle(title,subtitle),
            ],
          ),
        ),
    );
  }

  Widget _drawImage() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width* 0.33,
            height: MediaQuery.of(context).size.height * 0.33,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/1.jpg'),
                  fit: BoxFit.cover,
                )),
          )
        ]);
  }

  Widget _drawTitle(String title,String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style:TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(subTitle,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _drowFooterCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          child: Text(
            'NO COMMINTS',
            style: TextStyle(color: Colors.orange),
          ),
          onPressed: () {},
        ),
        Row(
          children: <Widget>[
            FlatButton(
                child: Text('SHARE',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.w700)),
                onPressed: () {}),
            FlatButton(
                child: Text('OPEN',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.w700)),
                onPressed: () {}),
          ],
        )
      ],
    );
  }

  Widget _drowHashTag() {
    return Wrap(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child:
            Text('#Advance', style: TextStyle(color: Colors.orange.shade800)),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child:
            Text('#Advance', style: TextStyle(color: Colors.orange.shade800)),
      ),
    ]);
  }
}
