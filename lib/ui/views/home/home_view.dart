import 'package:flutter/material.dart';
import 'package:say_oldbirds_flutter/datamodels/message.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

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
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red),
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
          body = Container();
        } else {
          body = ListView.builder(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            itemBuilder: (context, index) {
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
                margin: EdgeInsets.only(left: 200, right: 200),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(children: [
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
                        ])),
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
            },
            itemCount: model.data.data.messages.length,
          );
        }

        return Scaffold(
          backgroundColor: Color(0xffF2F2F2),
          body: body,
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
