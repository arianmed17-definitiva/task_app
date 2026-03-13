import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {

  final String apiKey = "a6bdc8e050b0309b6e86de0bdacae0cd";

  Future<Map<String, dynamic>> getWeather(String city) async {

    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=es";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      final Map<String, dynamic> data = jsonDecode(response.body);

      return data;

    } else {

      throw Exception("Error al obtener el clima");

    }
  }
}