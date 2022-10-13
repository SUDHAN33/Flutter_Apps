import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];


class Coin {
  Coin({
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.chagePercetage,
    required this.imageUrl,

  });

  String name;
  String symbol;
  num price;
  num change;
  num chagePercetage;
  Image imageUrl;

  factory Coin.fromJson  (Map<String, dynamic> json) {
       var url = json['image'];

    return Coin(
        name: json['name'],
        symbol: json['symbol'],
        price: json['current_price'],
        change: json['price_change_24h'],
        chagePercetage: json['price_change_percentage_24h'],
        imageUrl: Image(
               image: NetworkImage(url),
        ),
    );
  }


}

List<Coin> coinList = [];