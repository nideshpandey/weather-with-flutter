class Weather{

  final String? cityName;
  final double? temperature;
  final String? description;
  final String? icon;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/$icon@2x.png';

  }
  

  Weather( {required this.cityName,required this.temperature,required this.description,required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json){
    final cityName = json['name'];
    final temperature = json['main']['temp'];
    final description = json['weather'][0]['description'];
    final icon = json['weather'][0]['icon'];

    return Weather(cityName: cityName, temperature: temperature, description: description, icon: icon );
  }


}