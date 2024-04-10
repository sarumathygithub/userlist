import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:userlist/Constants/TextConstants.dart';
import 'package:userlist/UI/UserList/UserListModel.dart';

class UserListViewModel extends GetxController {
  UserList? userData;

  Future<UserList?> fetchUsers() async {
    final uri = Uri.parse("$baseUrl$getUserdata");
    final response = await http.get(uri, headers: {"page": "1"});
    userData = userListFromJson(response.body);
    update();
    if (response.statusCode == 200) {
      return userData;
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }
}
