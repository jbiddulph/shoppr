import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shopper_app/Assistants/requestAssistant.dart';
import 'package:shopper_app/DataHandler/appData.dart';
import 'package:shopper_app/Models/address.dart';
import 'package:shopper_app/configMaps.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(
      Position position, context) async {
    String placeAddress = null;
    String st0, st1, st2, st3, st4, st5;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${mapKey}";
    var response = await RequestAssistant.getRequest(url);
    if (response != "Failed") {
      // placeAddress = response["results"][0]["formatted_address"];
      st0 = response["results"][0]["address_components"][0]["long_name"];
      st1 = response["results"][0]["address_components"][1]["long_name"];
      st2 = response["results"][0]["address_components"][2]["long_name"];
      st3 = response["results"][0]["address_components"][3]["long_name"];
      st4 = response["results"][0]["address_components"][6]["short_name"];
      st5 = response["results"][0]["address_components"][7]["long_name"];
      placeAddress = st0 + " " + st1 + " " + st2 + " " + st3 + " " + st5;
      Address userPickUpAddress = new Address();
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.placeName = placeAddress;

      Provider.of<AppData>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);
    }

    return placeAddress;
  }
}
