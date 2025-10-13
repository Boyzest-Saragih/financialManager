import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/custom_textField.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController chatMessageCtr = TextEditingController();
  String chatMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomCardContainer(
                        isShadow: false,
                        widthContainer: 300,
                        childContainer: Text(
                          "datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomCardContainer(
                        isShadow: false,
                        widthContainer: 300,
                        childContainer: Text(
                          "datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 400,
                child: CustomTextField(
                  controller: chatMessageCtr,
                  hint: "Ask about your finance",
                  onChangedField: (value) {
                      chatMessage = value;
                  },
                  ),
              ),
              Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  CircleAvatar(backgroundColor: Colors.blue,radius: 24,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.send, color: Colors.white,))
                ],
              )
            ],
          )
          ],
        ),
      ),
    );
  }
}
