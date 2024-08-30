// ignore_for_file: prefer_const_declarations

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  const String API_KEY = 'b7359c63c28d04a3562a5d0bc0ec7113'; // Your API key
  const double latitude = 37.7749;
  const double longitude = -122.4194;

  final url =
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$API_KEY';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print('Weather data: $data');
  } else {
    print('Failed to fetch weather data. Status code: ${response.statusCode}');
    print('Error message: ${response.body}');
  }
}
