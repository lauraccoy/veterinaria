import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _firebaseToken = 'AIzaSyBxMAXyRVCgRp52JnLVGemDlHW8pBIr8a8';

//LOGIN
  Future<String?> login(String email, String password) async { //crea un mapa con los datos que voy a enviar
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken');

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      print(decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }
}