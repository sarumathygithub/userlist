import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userlist/UI/UserList/UserListViewModel.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<UserListViewModel>(
        init: UserListViewModel(),
        builder: (userListViewModel) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Page',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25
              ),),
              centerTitle: true,
              backgroundColor: Color(0xffa64dff).withOpacity(0.7),
              elevation: 10,
              toolbarHeight: 80,
      
      
            ),
            body: userListViewModel.userData != null
                ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                  itemCount: userListViewModel.userData!.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              onTap: (){},
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(userListViewModel.userData!.data[index].avatar),
                              ),
                              title: Text(
                                  '${userListViewModel.userData!.data[index].firstName} ${userListViewModel.userData!.data[index].lastName}'),
                              subtitle: Text(userListViewModel.userData!.data[index].email),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                )
                : const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
