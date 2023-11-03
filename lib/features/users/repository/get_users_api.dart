import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../model/user_list_response_model.dart';

class UserRepository {
  /// fetch all the user details.
  static Future<Either<UserListResponseModel, Exception>> getUsersAPI(
      BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Either<dynamic, Exception> data = await API.callAPI(context,
        url: APIUtilities.userListUrl, type: APIType.tGet);

    if (data.isLeft) {
      try {
        return Left(UserListResponseModel.fromJson(data.left));
      } catch (e) {
        print(e);
        return Right(DataToModelConversionException());
      }
    } else {
      return Right(data.right);
    }
  }
}
