import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Utilities/string_constant.dart';
import '../../models/user_model.dart';
import '../../models/menu_model.dart';
import 'package:http/http.dart' as http;

import '../idempiere_rest/idempiere_client.dart';
import '../idempiere_rest/session.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';


enum AppEndpoint {
  login,
  register,
  profile,
  logout,
  menuList,
}

class AppService extends ChangeNotifier {
  //MARK: EndPoint
  String getEndpointUrl(AppEndpoint endpoint) {
    switch (endpoint) {
      case AppEndpoint.login:
        return '${Texts.baseUrl()}auth/tokens';
      case AppEndpoint.register:
        return '${Texts.baseUrl()}auth/register';
      case AppEndpoint.profile:
        return '${Texts.baseUrl()}users/profile';
      case AppEndpoint.logout:
        return '${Texts.baseUrl()}auth/logout';
      case AppEndpoint.menuList:
        //return '';
        return 'https://gist.githubusercontent.com/jerrypm/65bd1be2834809351c55125ddd4ce56b/raw/ef95e919f44028c9c60002a1f00fa52775ee9fe7/menu_food.json';
    }
  }

  //MARK: Login
  void signIn(String email, String password,
      Function(UserResponse?, bool) completion) async {
    final authService = AppService();
    const endpoint = AppEndpoint.login;
    final urlString = authService.getEndpointUrl(endpoint);
    Uri url = Uri.parse(urlString);

    IdempiereClient().setBaseUrl(Texts.baseUrl());
    var response = await IdempiereClient().login("/auth/tokens", email, password);
    int roleId = (await IdempiereClient().getRoles(response.clients.first.id!))
        .first
        .id!;

    int adOrgId = (await IdempiereClient()
        .getOrganizations(response.clients.first.id!, roleId))
        .first
        .id!;
    int warehouseId = (await IdempiereClient()
        .getWarehouses(response.clients.first.id!, roleId, adOrgId))
        .first
        .id!;
    Session s = await IdempiereClient().initSession(
        "/auth/tokens", response.token, response.clients.first.id!, roleId,
        organizationId: adOrgId, warehouseId: warehouseId);
    /*var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"userName": email, "password": password}),
    );
*/


/*    ModelBase record = await IdempiereClient().getRecord<ModelBase>(
              "/models/ad_user", 1000002, (json) => ModelBase(json));*/
    if (  s.token.isNotEmpty) {

      UserResponse user = UserResponse.init( email,email,s.userId,s.token);
      completion(user, true);
    } else {
      completion(null, false);
    }
  }

  //MARK: Register
  void signUp(String name, String email, String password,
      Function(UserResponse?, bool) completion) async {
    final authService = AppService();
    const endpoint = AppEndpoint.register;
    final urlString = authService.getEndpointUrl(endpoint);
    Uri url = Uri.parse(urlString);

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": name,
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      //UserResponse user =
       //   UserResponse.init(json.decode(response.body)); // passing model
      //completion(user, true);
    } else {
      completion(null, false);
    }
  }

  void menuList(Function(MenuModel?, bool) completion) async {
    final menuService = AppService();
    const endpoint = AppEndpoint.menuList; //AppEndpoint.profile;//
    final urlString = menuService.getEndpointUrl(endpoint);
    Uri url = Uri.parse(urlString);

    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      MenuModel menu = MenuModel.fromJson(json.decode(response.body));
      completion(menu, true);
    } else {
      completion(null, false);
    }
  }
}
