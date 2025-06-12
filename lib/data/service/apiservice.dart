import 'dart:convert';
import 'dart:developer';

import 'package:codeedex_test/data/api/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum Method { get, post, update, delete }

class Api {
  static const _header = {'Content-Type': 'application/json'};

  static Future? call(
    BuildContext context, {
    required String endpoint,
    required Method method,
    Object? body,
    dynamic header,
  }) async {
    final http.Response response;
    try {
      switch (method) {
        case Method.get:
          String url = baseUrl + endpoint;
          response = await http.get(Uri.parse(url), headers: header ?? _header);
          log(response.body);
          try {
            final data = json.decode(response.body);
            return data;
          } catch (e) {
            return {'status': false};
          }
        case Method.post:
        default:
      }
    } catch (e) {
      return {'status':false};
    }
  }
}
