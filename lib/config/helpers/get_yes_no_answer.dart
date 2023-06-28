import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yes_no_app/features/chat/data/models/yes_no_model.dart';
import 'package:yes_no_app/features/chat/domain/entities/message.dart';

class GetYesNoAnswers {
  // final repository = YesNoRepository(HttpClient());
  final httpClient = http.Client();
  Future<Message> getAnswer() async {
    final response = await httpClient.get(Uri.parse('https://yesno.wtf/api'));
    final responseData = jsonDecode(response.body);
    final yesNoModel = YesNoModel.fromJsonMap(responseData);
    debugPrint(yesNoModel.toMessageEntity().imageUrl);
    return yesNoModel.toMessageEntity();
    //debugPrint('${response.body}');
    //throw UnimplementedError();
  }
}
