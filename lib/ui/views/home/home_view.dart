import 'package:flutter/material.dart';
import 'package:say_oldbirds_flutter/datamodels/message.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        Widget body;
        if (model.isBusy) {
          body = Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitFadingCube(
                    size: 50,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      '加载留言',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (model.hasError) {
          body = Center(
            child: Container(
              child: Text(
                '加载留言',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          );
        } else {
          body = CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Text(
                    '${model.data.data.messages.length} messages',
                    style: TextStyle(color: Color(0xff333333), fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 10, bottom: 30),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    Message message = model.data.data.messages[index];
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
                  }, childCount: model.data.data.messages.length),
                ),
              )
            ],
          );
        }
        double sizeW = MediaQuery.of(context).size.width;
        return Scaffold(
          body: Container(child: body, margin: EdgeInsets.symmetric(horizontal: sizeW > 500 ? 200 * sizeW / 1024 : 20)),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
