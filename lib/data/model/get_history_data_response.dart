// To parse this JSON data, do
//
//     final getHistoryDataResponse = getHistoryDataResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetHistoryDataResponse getHistoryDataResponseFromJson(String str) => GetHistoryDataResponse.fromJson(json.decode(str));

String getHistoryDataResponseToJson(GetHistoryDataResponse data) => json.encode(data.toJson());

class GetHistoryDataResponse {
  GetHistoryDataResponse({
    required this.data,
    required this.status,
  });

  final Data data;
  final Status status;

  factory GetHistoryDataResponse.fromJson(Map<String, dynamic> json) => GetHistoryDataResponse(
    data: Data.fromJson(json['data']),
    status: Status.fromJson(json['status']),
  );

  Map<String, dynamic> toJson() => {
    'data': data.toJson(),
    'status': status.toJson(),
  };
}

class Data {
  Data({
    required this.quotes,
  });

  final List<QuoteElement> quotes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    quotes: List<QuoteElement>.from(json['quotes'].map((x) => QuoteElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'quotes': List<dynamic>.from(quotes.map((x) => x.toJson())),
  };
}

class QuoteElement {
  QuoteElement({
    required this.quote,
  });
  final QuoteQuote quote;

  factory QuoteElement.fromJson(Map<String, dynamic> json) => QuoteElement(
    quote: QuoteQuote.fromJson(json['quote']),
  );

  Map<String, dynamic> toJson() => {
    'quote': quote.toJson(),
  };
}

class QuoteQuote {
  QuoteQuote({
    required this.close,
  });

  final double close;

  factory QuoteQuote.fromJson(Map<String, dynamic> json) => QuoteQuote(
    close: json['close'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'close': close,
  };
}

class Status {
  Status({
    required this.errorCode,
    required this.errorMessage,
  });

  final String errorCode;
  final String errorMessage;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    errorCode: json['error_code'],
    errorMessage: json['error_message'],
  );

  Map<String, dynamic> toJson() => {
    'error_code': errorCode,
    'error_message': errorMessage
  };
}
