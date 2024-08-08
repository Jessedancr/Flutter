import 'dart:convert';

import 'package:http/http.dart' as http;

Future getData() async {
  var response = await http
      .get(Uri.https('worldtimeapi.org', 'api/timezone/Africa/Lagos'));

  return DateTimeApi.jsonResponse(jsonDecode(response.body));
}

class DateTimeApi {
  String datetime;
  DateTimeApi({
    required this.datetime,
  });

  // Factory constructor
  factory DateTimeApi.jsonResponse(Map<String, dynamic> json) {
    return (DateTimeApi(
      datetime: json['datetime'],
    ));
  }
}
