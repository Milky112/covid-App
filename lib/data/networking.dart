import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  var covidData = <String, int>{};
  Future getData() async {
    http.Response response = await http
        .get('https://coronavirus-19-api.herokuapp.com/countries/world');
    String jsonData = response.body;
    if (response.statusCode == 200) {
      covidData['world case'] = jsonDecode(jsonData)['cases'];
      covidData['world recover'] = jsonDecode(jsonData)['recovered'];
      covidData['world death'] = jsonDecode(jsonData)['deaths'];
      covidData['world active'] = jsonDecode(jsonData)['active'];
      covidData['world daily case'] = jsonDecode(jsonData)['todayCases'];
      covidData['world daily death'] = jsonDecode(jsonData)['todayDeaths'];
    }

    http.Response indoResponse = await http
        .get('https://coronavirus-19-api.herokuapp.com/countries/indonesia');
    String jsonIndo = indoResponse.body;

    if (indoResponse.statusCode == 200) {
      covidData['indo case'] = jsonDecode(jsonIndo)['cases'];
      covidData['indo recover'] = jsonDecode(jsonIndo)['recovered'];
      covidData['indo death'] = jsonDecode(jsonIndo)['deaths'];
      covidData['indo active'] = jsonDecode(jsonIndo)['active'];
      covidData['daily case'] = jsonDecode(jsonIndo)['todayCases'];
      covidData['daily death'] = jsonDecode(jsonIndo)['todayDeaths'];
    }

    http.Response cityResponse =
        await http.get('https://indonesia-covid-19.mathdro.id/api/provinsi');
    String CityData = cityResponse.body;
    if (cityResponse.statusCode == 200) {
      covidData['jakarta case'] = jsonDecode(CityData)['data'][0]['kasusPosi'];
      covidData['jakarta recover'] =
          jsonDecode(CityData)['data'][0]['kasusSemb'];
      covidData['jatim case'] = jsonDecode(CityData)['data'][1]['kasusPosi'];
      covidData['jatim recover'] = jsonDecode(CityData)['data'][1]['kasusSemb'];
      covidData['jateng case'] = jsonDecode(CityData)['data'][2]['kasusPosi'];
      covidData['jateng recover'] =
          jsonDecode(CityData)['data'][2]['kasusSemb'];
      covidData['jakbar case'] = jsonDecode(CityData)['data'][3]['kasusPosi'];
      covidData['jakbar recover'] =
          jsonDecode(CityData)['data'][3]['kasusSemb'];
      covidData['kalbar case'] = jsonDecode(CityData)['data'][25]['kasusPosi'];
      covidData['kalbar recover'] =
          jsonDecode(CityData)['data'][25]['kasusSemb'];
    }

    return covidData;
  }
}
