import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/users_view_model.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
        actions: [
          IconButton(
              onPressed: () async {
                bool userAdded = await usersViewModel.addUser();
                if (!userAdded) {
                  return;
                }
                Navigator.pop(context);
              },
              icon: Icon(Icons.save)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Name'),
              onChanged: (val) async {
                usersViewModel.addingUser!.name = val;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (val) async {
                usersViewModel.addingUser!.email = val;
              },
            ),
          ],
        ),
      ),
    );
  }
}
