import 'dart:convert';

import 'package:flutter_test_project/core/constants.dart';

import 'package:flutter_test_project/features/home/data/dto/user_dto.dart';

import 'package:http/http.dart' as http;

abstract class UsersApi {
  Future<List<UsersDto>> getUsers();
}

class UsersApiImpl extends UsersApi {
  final http.Client client;

  UsersApiImpl({required this.client});

  @override
  getUsers() => getUsersFromUrl(userUrl);
  Future<List<UsersDto>> getUsersFromUrl(String userUrl) async {
    try {
      final response = await http.get(
        Uri.parse(userUrl),
      );

      final jsonUser = json.decode(response.body);
      List<UsersDto> listUsers = [];
      for (final item in jsonUser) {
        UsersDto resposse = UsersDto.fromJson(item);
        listUsers.add(resposse);
      }

      return listUsers;
    } catch (error) {
      print(error);
      return [];
    }
  }
}
