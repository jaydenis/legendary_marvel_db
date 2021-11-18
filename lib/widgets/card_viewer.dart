
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/data/legendary_cards_json.dart';
import 'package:legendary_marvel_db/swipe_deck/card_label.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:swipable_stack/swipable_stack.dart';

class SwipeDirectionColor {
  static const right = Color.fromRGBO(70, 195, 120, 1);
  static const left = Color.fromRGBO(220, 90, 108, 1);
  static const up = Color.fromRGBO(83, 170, 232, 1);
  static const down = Color.fromRGBO(154, 85, 215, 1);
}

extension SwipeDirecionX on SwipeDirection {
  Color get color {
    switch (this) {
      case SwipeDirection.right:
        return Color.fromRGBO(70, 195, 120, 1);
      case SwipeDirection.left:
        return Color.fromRGBO(220, 90, 108, 1);
      case SwipeDirection.up:
        return Color.fromRGBO(83, 170, 232, 1);
      case SwipeDirection.down:
        return Color.fromRGBO(154, 85, 215, 1);
    }
    return Colors.transparent;
  }
}


class CardViewer extends StatefulWidget {
final int deckId;
  const CardViewer({
    Key? key,
    required this.deckId
  }) : super(key: key);

  @override
  _CardViewerState createState() => _CardViewerState();
}

class _CardViewerState extends State<CardViewer> {

  late SwipableStackController _controller;

  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  static const double _bottomAreaHeight = 100;

  static const EdgeInsets _padding = EdgeInsets.all(16);




  @override
  Widget build(BuildContext context) {
    var objects = legendaryCards.where((element) =>
    element['deckId'] == widget.deckId).toList();
    List<String> imageList = [];
    for (var image in objects) {
      imageList.add(image['cardImage']);
    }
    return Container(
      child: Column(
        children: [
          Expanded(
            child: SwipableStack(
              controller: _controller,
              stackClipBehaviour: Clip.none,
              onSwipeCompleted: (index, direction) {
                print('$index, $direction');
              },

              builder: (context, index, constraints) {
                final imagePath = objects[index % objects.length]['cardImage'];
                final cardText = objects[index % objects.length]['cardName'];
                return Padding(
                  padding: _padding,
                  child: Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                // A fixed-height child.
                                color: const Color(0xffffffff), //
                                height: 24.0,
                                alignment: Alignment.center,
                                child:  Text(cardText,
                                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff000000)),
                                ),
                              ),
                              Container(
                                child:
                                Image.network(
                                    getImageNetwork(imagePath)),
                                height: constraints.maxHeight-25,
                                ),
                            ],
                          ),
                        ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          /*SizedBox(
            height: _bottomAreaHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _BottomButton(
                  color: _controller.canRewind
                      ? Colors.amberAccent
                      : Colors.grey,
                  child: Icon(Icons.refresh),
                  onPressed: () {
                    _controller.canRewind;
                  }
                ),
                _BottomButton(
                  color: SwipeDirectionColor.left,
                  child: const Icon(Icons.arrow_back),
                  onPressed: () {
                    _controller.next(
                      swipeDirection: SwipeDirection.left,
                    );
                  },
                ),
                _BottomButton(
                  color: SwipeDirectionColor.up,
                  onPressed: () {
                    _controller.next(
                      swipeDirection: SwipeDirection.up,
                    );
                  },
                  child: const Icon(Icons.arrow_upward),
                ),
                _BottomButton(
                  color: SwipeDirectionColor.right,
                  onPressed: () {
                    _controller.next(
                      swipeDirection: SwipeDirection.right,
                    );
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
                _BottomButton(
                  color: SwipeDirectionColor.down,
                  onPressed: () {
                    _controller.next(
                      swipeDirection: SwipeDirection.down,
                    );
                  },
                  child: const Icon(Icons.arrow_downward),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_listenController);
    _controller.dispose();
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.color,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Icon child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
                (states) => color,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}