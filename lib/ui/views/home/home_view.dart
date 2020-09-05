import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:say_oldbirds_flutter/ui/views/home/message_add_view.dart';

import 'messages_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW > 500 ? 200 * sizeW / 1024 : 20),
      child: CustomScrollView(slivers: [
        HomeMessageAddView(),
        MessagesView(),
      ]),
    ));
  }
}
