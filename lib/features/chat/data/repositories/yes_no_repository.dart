import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yes_no_app/features/chat/data/http/exceptions.dart';
import 'package:yes_no_app/features/chat/data/http/http_client.dart';
import 'package:yes_no_app/features/chat/data/models/yes_no_model.dart';
import 'package:yes_no_app/features/chat/domain/entities/message.dart';

abstract class IYesNoRepository {
  Future<Message> getYesNoAnswer();
}

class YesNoRepository implements IYesNoRepository {
  final IHttpService httpService;

  YesNoRepository(this.httpService);
  @override
  Future<Message> getYesNoAnswer() async{
    final response = await httpService.get(url: 'https://yesno.wtf/api');
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      final yesNoModel = YesNoModel.fromMap(response.body);
      return Message(text: yesNoModel.answer, fromWho:  FromWho.hers,imageUrl: yesNoModel.image);
      //debugPrint(body);
    } else if(response.statusCode == 404){
      throw NotFoundExceptions('The url is invalid');
    }
    throw Exception('Failed to load messages');
  }
}