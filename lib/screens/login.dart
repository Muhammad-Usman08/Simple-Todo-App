import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //controllers
  TextEditingController friendListController = TextEditingController();

  //list of users
  List user = ['Usman', 'ammar', 'ayaan'];

  //adding item function
  addItem() {
    if (friendListController != '') {
      setState(() {
        user.add('${friendListController.text}');
        friendListController.clear();
      });
    } else {
      print('Field cannot be emptyied');
    }
  }

  //remove item
  removeItem(index) {
    setState(() {
      user.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: TextField(
          controller: friendListController,
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                addItem();
              },
              child: const Text('Add Todo'))
        ],
      ),
      body: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 2),
              child: ListTile(
                tileColor: Colors.grey,
                title: Text('${user[index]}'),
                trailing: IconButton(
                    onPressed: () {
                      removeItem(index);
                    },
                    icon: const Icon(Icons.delete)),
              ),
            );
          }),
    );
  }
}
