import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GitHubService {
  final String username;
  final String token = dotenv.env['GITHUB_KEY']!;

  GitHubService({required this.username});

  Future<Iterable<dynamic>> fetchRepos() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/speedfirev/repos'),
      headers: {
        'Authorization':
            'token $token', // Optional: only if you are using authentication
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      Iterable<Map<String, dynamic>> repos =
          jsonData.map((repo) => repo as Map<String, dynamic>).toList();
      print("Length: ${repos.length}");
      Iterable<Map<String, dynamic>> filteredRepos =
          repos.where((repo) => repo['type'] == "PushEvent");
      debugPrint(filteredRepos
          .firstWhere((repo) => repo["type"] == "PushEvent")
          .toString());
      return filteredRepos;
    } else {
      debugPrint("Error occured: ${response.statusCode}");
      throw Exception('Failed to load repositories');
    }
  }

  Future<Iterable<dynamic>> fetchEvents() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/speedfirev/events'),
      headers: {
        'Authorization':
            'token $token', // Optional: only if you are using authentication
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      Iterable<Map<String, dynamic>> repos =
          jsonData.map((event) => event as Map<String, dynamic>);
      print("HERE" + (repos.elementAt(0)["type"] == "PushEvent").toString());
      repos = repos.where((event) => event['type'] == "PushEvent");
      List listOfRepos = repos.toList();

      listOfRepos.sort((a, b) {
        DateTime dateA = DateTime.parse(a['created_at']);
        DateTime dateB = DateTime.parse(b['created_at']);
        return dateA.compareTo(dateB);
      });
      return listOfRepos.reversed;
    } else {
      debugPrint("Error occured: ${response.statusCode}");
      throw Exception('Failed to load repositories');
    }
  }
}
