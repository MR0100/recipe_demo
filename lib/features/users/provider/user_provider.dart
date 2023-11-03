import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../model/user_list_response_model.dart';
import '../repository/get_users_api.dart';

/// UserProvider
class UserProvider extends ChangeNotifier {
  Either<UserListResponseModel, Exception> _userDetailsData =
      Right(NoDataFoundException());

  /// getter setter of userDetailsData.
  Either<UserListResponseModel, Exception> get userDetailsData =>
      _userDetailsData;
  set userDetailsData(Either<UserListResponseModel, Exception> value) {
    _userDetailsData = value;
    notifyListeners();
  }

  /// get user details.
  void getUsersList(BuildContext context) async {
    userDetailsData = Right(FetchingDataException());
    Either<UserListResponseModel, Exception> data =
        await UserRepository.getUsersAPI(context);
    userDetailsData = data;
  }
}
