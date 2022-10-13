import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'coinData.dart';
import 'coinDemo.dart';
import 'dart:io' as Platform;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=flase#'));
    if (response.statusCode == 200) {
      List<dynamic> value = [];
      value = json.decode(response.body);
      if (value.length > 0) {
        for (int i = 0; i < value.length; i++) {
          if (value[i] != null) {
            Map<String, dynamic> mp = value[i];
            coinList.add(Coin.fromJson(mp));
          }
        }

        setState(() {
          coinList;
        });
      }

      return coinList;
    } else {
      throw Exception('Failed to load coins!');
    }
  }

  @override
  void initState() {
    fetchCoin();

    // ignore: prefer_const_constructors
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }

  String? selectedCurrency = 'USD';
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
         // getData();
        });
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor:  Color(0xFF111328),
      appBar: AppBar(
         // backgroundColor: Colors.grey[300],
          title:
          Text('CRYPTO CHECKER',
              style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 25,
                  fontWeight: FontWeight.bold)
          )),
      body:  ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: coinList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [

                  coinCard(
                    name: coinList[index].name,
                    symbol: coinList[index].symbol,
                    price: coinList[index].price.toDouble(),
                    change: coinList[index].change.toDouble(),
                    chagePercetage: coinList[index].chagePercetage.toDouble(),
                    imageUrl: coinList[index].imageUrl,
                  ),
                ],
              );
            }
            ),

    );
  }
}

