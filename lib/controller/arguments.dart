import 'package:evchstation/models/poi/comment/usercomment.dart';
import 'package:evchstation/models/poi/connections/connection.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:evchstation/models/poi/statustype.dart';


class Arguments {
  final AddressInfo addressinfo;
  final StatusType? statustype;
  List? connections;
  final int id;
  final String usagecost;
  final OperatorInfo operatorinfo;


  //final String operatorname;
  final String statustypetitle;
  final String usagetypetitle;
  //final String websiteurl;
  final int numberofpoints;
  //final String currenttype;
    final List<UserComment> usercomment;

  final List connection;
  final List media;
  //final Map<String,dynamic> opinf;

  Arguments({
    required this.addressinfo,
    required this.operatorinfo,
    required this.statustype,

    //required this.operatorname,
    required this.id,
    required this.statustypetitle,
    required this.usagetypetitle,
    required this.usagecost,
    //required this.websiteurl,
    required this.numberofpoints,

    // required this.currenttype,
    required this.usercomment,
    required this.connection,
    required this.media,
    // required this.opinf
  });
}
