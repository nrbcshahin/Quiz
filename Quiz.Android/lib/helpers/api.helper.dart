import 'package:dio/dio.dart';
import 'package:quiz/helpers/constants.dart';

import '../models/api.dart';

class Api {
  Future<ApiResponse> post(String url, Map json) async {
    print(apiUrl + url);
    try {
      Dio dio = Dio();
      Response response = await dio.post(apiUrl + url, data: json);

      if (response.statusCode == 200) {
        var data = response.data;
        print(data);
        if (!data["success"]) {
          return ApiResponse(false, data["message"], null);
        }

        return ApiResponse(true, "Data fetch successfully", data);
      }
      return ApiResponse(true, "There are no response from api", response.data);
    } catch (error) {
      print(error);
      return ApiResponse(
          false, "The request can't process at this moment", null);
    }
  }
}
