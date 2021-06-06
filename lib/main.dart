import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Homer()));
}



class Homer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: View(
        numberOfItems: 20,
      ),
    );
  }
}

class Item {
  static final random = Random();
  final double _size;
  // final Color _color;
  String image = "";

  final Alignment _alignment;
  Item(this._size,this._alignment,this.image);

  // Item() {
  //   _color = Color.fromARGB(random.nextInt(255), random.nextInt(255),
  //       random.nextInt(255), random.nextInt(255));
  //   _alignment =
  //       Alignment(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1);
  //   _size = random.nextDouble() * 40 + 1;
  // }
}

class View extends StatefulWidget {
  final int numberOfItems;

  const View({required this.numberOfItems});

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> with SingleTickerProviderStateMixin {
  var items = <Item>[];
  var started = false;
  static final random = Random();
  String strHaha = 'assets/images/haha.png';
  String strwow = 'assets/images/wow.png';
  String strlove = 'assets/images/love.png';
  String strangry = 'assets/images/angry.png';
  String strsad = 'assets/images/sad.png';

  late AnimationController animationController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Scaffold(
              appBar: AppBar(
                title: Text("Emoji Example Rain"),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        makeItems(strHaha);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration:
                        BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: ExactAssetImage(strHaha))),
                        // RaisedButton(
                        //
                        //   child: Text("T"),
                        //   onPressed: (){
                        //     makeItems(strHaha);
                        //   },
                        // ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        makeItems(strwow);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration:
                        BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(strwow))),
                        // RaisedButton(
                        //
                        //   child: Text("T"),
                        //   onPressed: (){
                        //     makeItems(strHaha);
                        //   },
                        // ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        makeItems(strsad);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration:
                        BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(strsad))),
                        // RaisedButton(
                        //
                        //   child: Text("T"),
                        //   onPressed: (){
                        //     makeItems(strHaha);
                        //   },
                        // ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        makeItems(strangry);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration:
                        BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(strangry))),
                        // RaisedButton(
                        //
                        //   child: Text("T"),
                        //   onPressed: (){
                        //     makeItems(strHaha);
                        //   },
                        // ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        makeItems(strlove);
                      },
                      child: Container(
                        height: 50,
                        width: 50,

                        decoration:
                        BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(strlove))),
                        // RaisedButton(
                        //
                        //   child: Text("T"),
                        //   onPressed: (){
                        //     makeItems(strHaha);
                        //   },
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...buildItems()
          ],
        ),
      ),
    );
  }

  List<Widget> buildItems() {
    return items.map((item) {
      var tween = Tween<Offset>(
          begin: Offset(Random().nextDouble() * 0.5, 2),
          end: Offset(0, Random().nextDouble() * -1 - 1))
          .chain(CurveTween(curve: Curves.linear));
      return SlideTransition(
        position: animationController.drive(tween),
        child: AnimatedAlign(
          alignment: item._alignment,
          duration: Duration(seconds: 10),
          child: AnimatedContainer(
            duration: Duration(seconds: 10),
            width: item._size,
            height: item._size,
            decoration:
            BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(item.image))),
          ),
        ),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
  }

  void makeItems(String ima) {
    setState(() {
      items.clear();
      for (int i = 0; i < widget.numberOfItems; i++) {
        items.add(Item(random.nextDouble() * 40 + 1,Alignment(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1),ima));
      }
    });
    animationController.reset();
    animationController.forward();
  }
}