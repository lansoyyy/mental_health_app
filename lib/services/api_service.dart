import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:mental_health_app/utils/const.dart';

class ChatGPTService {
  final String _apiUrl = 'https://api.openai.com/v1/completions';

  Future<String> getResponse(String message) async {
    final response = await http.post(Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openaikey'
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'prompt': message,
          'max_tokens': 20 // Reduced from 60 to 20
        }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['choices'][0]['text'];
    } else if (response.statusCode == 429) {
      final retryAfter = response.headers['retry-after'];
      final waitTime = retryAfter != null ? int.parse(retryAfter) : 2;
      print('Rate limit hit. Retrying after $waitTime seconds...');
      await Future.delayed(Duration(seconds: waitTime));
    } else {
      throw Exception('Failed to load response: ${response.statusCode}');
    }
    throw Exception('Failed to load response');
  }
}
