import 'package:flutter/material.dart';

import '../pages/chat_page.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatPage(
      data: {'email': "pranav@gmail.com", 'name': 'Pranav Nair'},
      receiverId: 'KrK2WHfOXER8wHo8VZcWtmYDOxm1',
    );
    //return LoginPage();
  }
}
