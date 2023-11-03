import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../model/user_list_response_model.dart';
import '../provider/user_provider.dart';

/// UserScreen
class UserScreen extends StatefulWidget {
  /// Constructor of user screen.
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getUsersList(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Application User List'),
        backgroundColor: VariableUtilities.theme.green,
        actions: [
          IconButton(
            onPressed: () {
              ThemeManager.switchTheme(context);
              setState(() {});
            },
            icon: Icon(
              VariableUtilities.theme is LightTheme
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          )
        ],
      ),
      body: Consumer<UserProvider>(builder:
          (BuildContext context, UserProvider userProvider, Widget? child) {
        if (userProvider.userDetailsData.isRight) {
          if (userProvider.userDetailsData.right is NoDataFoundException) {
            /// No Data Found Widget...
            return const Text('No Data Found!');
          } else if (userProvider.userDetailsData.right
              is FetchingDataException) {
            /// Fetching Data Widget...
            return const CircularProgressIndicator();
          }
          return const CircularProgressIndicator();
        } else {
          UserListResponseModel data = userProvider.userDetailsData.left;
          return ListView.builder(
            itemCount: data.data?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  data.data![index].firstName,
                  style: FontUtilities.style(
                    fontSize: 14,
                    fontColor: VariableUtilities.theme.black,
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
