import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_eg1/components/app_loading.dart';
import 'package:provider_mvvm_eg1/users_list/models/users_list_model.dart';
import 'package:provider_mvvm_eg1/users_list/view_models/users_view_model.dart';
import 'package:provider_mvvm_eg1/utlis/navigation_utlis.dart';
import '../../components/app_error.dart';
import '../../components/user_list_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            onPressed: () async {
              openAddUser(context);
            },
            icon: Icon(Icons.add),
          ),
          // IconButton(
          //   onPressed: () async {
          //     usersViewModel.getUsers();
          //   },
          //   icon: Icon(Icons.refresh),
          // )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(usersViewModel),
          ],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError != null) {
      return AppError(
        errorText: usersViewModel.userError!.message!,
      );
    }
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: usersViewModel.userListModel.length,
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModel.userListModel[index];
          return UserListRow(
            key: ValueKey(userModel),
            userModel: userModel,
            onTap: () async {
              usersViewModel.setSelectedUser(userModel);
              openUserDetail(context);
            },
          );
        },
      ),
    );
  }
}
