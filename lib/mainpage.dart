import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {

  var temp;
  var discription;
  var humitity;
  var windspeed;
  var currently;
  var feel_like;
  var pressure;

  Future GetWeather () async {
    http.Response response = await http.get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=dhaka&appid=d73ac68e30207a26ad2333ee19430255"));
    var result = jsonDecode(response.body);
    setState(() {
      this.temp=result['main']['temp'];
      this.discription=result['weather'][0]['description'];
      this.currently=result['weather'][0]['main'];
      this.humitity=result['main']['humidity'];
      this.windspeed=result['wind']['speed'];
      this.feel_like=result['main']['feels_like'];
      this.pressure=result['main']['pressure'];
    });
  }

  @override
  void initState() {
    this.GetWeather();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.redAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Currently in Dhaka",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Text(
                  temp!=null ? temp.toString()+ "\u00B0": "Loading",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 40.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently!=null?currently.toString():"Loading",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.thermostat_rounded,
                    size: 30,
                  ),
                  title: Text("Temperature"),
                  trailing: Text(temp!=null?temp.toString()+"\u00B0":"Loading"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.cloud,
                    size: 30,
                  ),
                  title: Text("Weather"),
                  trailing: Text(discription!=null?discription.toString():"Loading"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.wb_sunny,
                    size: 30,
                  ),
                  title: Text("Humidity"),
                  trailing: Text(humitity!=null?humitity.toString():"Loading"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.fast_rewind,
                    size: 30,
                  ),
                  title: Text("WindSpeed"),
                  trailing: Text(windspeed!=null?windspeed.toString():"Loading"),
                ),ListTile(
                  leading: Icon(
                    Icons.wb_incandescent_rounded,
                    size: 30,
                  ),
                  title: Text("Feel Like"),
                  trailing: Text(feel_like!=null?feel_like.toString():"Loading"),
                ),ListTile(
                  leading: Icon(
                    Icons.whatshot_outlined,
                    size: 30,
                  ),
                  title: Text("pressure"),
                  trailing: Text(pressure!=null?pressure.toString():"Loading"),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
