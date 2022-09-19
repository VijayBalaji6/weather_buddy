import 'package:flutter/material.dart';
import 'package:weather_buddy/Services/WeatherAPIServices.dart';
import 'package:weather_buddy/Models/WeatherDataModel.dart';

class HomePage extends StatefulWidget {

  late String title;

  HomePage({
   required this.title,
});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  late Future<WeatherDataModel> weatherData ;

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromAPI();
  }

  getDataFromAPI()async{

    weatherData = WeatherApiService().fetchApi()!;
    weatherData.then((value) => WeatherDataModel.fromJson);
    setState(() {
      isLoading == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            widget.title
        ),
       ),
      body: Center(

        child: isLoading  != true

          ? FutureBuilder(
            future: weatherData,
            builder: (context,snap){
              if(snap.hasData){
                return ListView.builder(
                  itemCount: snap.data!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Text(snap.data!.data![index].uv.toString()),
                        Text(snap.data!.cityName!.toString()),
                        Text(
                          snap.data!.data![index].appTemp.toString(),
                        style: const TextStyle(
                          color: Colors.blue
                        ),)
                      ],
                    );
                  },

                );
              }
              else{
                return const Text('weather');
              }

        }

          )
          : const CircularProgressIndicator()

    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            weatherData = WeatherApiService().fetchApi()!;
          });
        },
      ),
    );

      }
}
