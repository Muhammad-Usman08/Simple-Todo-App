import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //controllers
  TextEditingController friendListController = TextEditingController();
  TextEditingController updateItemController = TextEditingController();

  //list of users
  List user = [];

  //adding item function
  addItem() {
    if (user != '') {
      setState(() {
        user.add('${friendListController.text}');
        friendListController.clear();
      });
    } else {
      print('It is a empty string');
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        title: TextField(
          style: const TextStyle(color: Colors.white),
          controller: friendListController,
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                addItem();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7fff06),
                textStyle: const TextStyle(color: Colors.white),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              child: const Text('Add Todo')),
        ],
      ),
      body: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 2),
              child: ListTile(
                tileColor: Colors.black,
                title: Text(
                  '${user[index]}',
                  style: const TextStyle(color: Color(0xFF858769)),
                ),
                trailing: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          removeItem(index);
                        },
                        icon: const Icon(Icons.delete)),
                    IconButton(
                        onPressed: () {
                          updateItemController.text = user[index];
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Update Value'),
                                  content: TextField(
                                    controller: updateItemController,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            user[index] =
                                                updateItemController.text;
                                          });
                                          updateItemController.clear();
                                          Navigator.pop(context);
                                        },
                                        child: const Text('update value'))
                                  ],
                                );
                              });
                        },
                        icon: const Icon(Icons.edit)),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
