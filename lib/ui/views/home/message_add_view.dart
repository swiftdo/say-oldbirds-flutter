import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'message_add_viewmodel.dart';

class HomeMessageAddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageAddViewModel>.reactive(
      builder: (context, model, child) {
        return SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 50),
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: 'Say Oldbirds',
                      style: TextStyle(
                        fontSize: 50,
                        color: Color(0xffEB5757),
                      ),
                    ),
                    TextSpan(
                      text: ' to the world',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff828282),
                      ),
                    ),
                  ]),
                ),
              ),
              FormInput(
                title: 'name',
                value: model.name,
                onChanged: (text) {
                  model.name = text;
                },
              ),
              FormInput(
                title: 'message',
                value: model.message,
                maxLine: 3,
                onChanged: (text) {
                  model.message = text;
                },
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    model.addMessage();
                  },
                  child: Text(
                    'submit',
                  ),
                  color: Color(0xffEB5757),
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  '${model.messages.length} messages',
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => MessageAddViewModel(),
    );
  }
}

class FormInput extends StatelessWidget {
  final String title;
  final int maxLine;
  final String value;
  final ValueChanged<String> onChanged;

  FormInput({this.title, this.maxLine, this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff333333),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            child: TextField(
              controller: TextEditingController(text: value),
              maxLines: maxLine,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
                isCollapsed: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
