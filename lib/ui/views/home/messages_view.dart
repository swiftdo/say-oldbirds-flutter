import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:say_oldbirds_flutter/datamodels/message.dart';
import 'package:stacked/stacked.dart';

import 'messages_viewmodel.dart';

class MessagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessagesViewModel>.reactive(
      viewModelBuilder: () => MessagesViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) {
        Widget body;
        if (model.isBusy) {
          body = SliverToBoxAdapter(
            child: Center(
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SpinKitFadingCube(
                    size: 50,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        } else if (model.hasError) {
          body = SliverToBoxAdapter(
            child: Center(
              child: Container(
                height: 200,
                child: Text(
                  '加载失败',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          );
        } else {
          body = SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              Message message = model.messages[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xffF2F2F2),
                    ),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                text: '${message.name} ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffEB5757),
                                ),
                              ),
                              TextSpan(
                                text: '#${message.id}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          message.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Text(
                        message.message,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                      margin: EdgeInsets.only(top: 10),
                    )
                  ],
                ),
              );
            }, childCount: model.messages.length),
          );
        }
        return SliverPadding(
          padding: EdgeInsets.only(top: 10),
          sliver: body,
        );
      },
    );
  }
}
