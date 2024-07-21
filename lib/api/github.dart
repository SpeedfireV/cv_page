import 'dart:convert';

import 'package:http/http.dart' as http;

class GitHubService {
  final String username;
  final String token; // Optional: if you want to use authentication

  GitHubService({required this.username, this.token = ''});

  Future<List<dynamic>> fetchRepos() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/$username/repos'),
      headers: {
        'Authorization':
            'token $token', // Optional: only if you are using authentication
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}
