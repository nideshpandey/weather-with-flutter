import 'package:flutter/material.dart';
import 'package:weatheria/models.dart';
import 'package:weatheria/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cityController = TextEditingController();
  final dataService = Service();

  Weather? response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (response != null)
              Column(
                children: [
                  Image.network(response!.iconUrl),
                  Text(response!.description.toString().toUpperCase()),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    '${response!.temperature}\u00b0',
                    style: const TextStyle(fontSize: 40),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Text(response!.cityName.toString()),
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: 200,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(labelText: 'City name...'),
                  controller: cityController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: OutlinedButton(
                  onPressed: getWeatherDetail,
                  child: const Text(
                    'Get Weather Detail',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getWeatherDetail() async {
    final data = await dataService.getData(cityController.text);
    print(data.temperature);
    setState(() {
      response = data;
    });
  }
}
