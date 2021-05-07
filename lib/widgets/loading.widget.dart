import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  bool busy = false;
  Widget child;

  LoadingWidget({@required this.busy, @required this.child});

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            height: 200,
            child: FlareActor(
              "assets/animations/initial.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              isPaused: false,
              animation: 'anim01',
            ),
          )
        : child;
  }
}
