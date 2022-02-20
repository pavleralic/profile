import 'dart:convert';

import 'package:flutter/services.dart';

import 'plugins/http_service_interface.dart';

class ProfileService {
  final HttpServiceInterface httpService;

  ProfileService({required this.httpService});

  Future<Map<String, dynamic>> getProfile() async {
    final String jsonText =
    await rootBundle.loadString('assets/mock/profile.json');
    return jsonDecode(jsonText) as Map<String, dynamic>;
  }
}
