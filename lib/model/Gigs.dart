// import 'package:fixme/Utils/utils.dart';

// class UserChat {
//   String idd;
//   final String idUser;
//   final String name;
//   bool read;
//   var block;
//   var status;
//   final String urlAvatar;
//   final String project_owner_user_id;
//   final String bid_id;
//   final String job_id;
//   final serviceId;
//   final String service_id;
//   final id;
//   final String docid;
//   final String fcmToken;
//   var lastMessageTime;
//   final String lastMessage;
//   final String userMobile;
//
//   UserChat({
//     this.idd,
//     this.name,
//     this.idUser,
//     this.block,
//     this.read,
//     this.status,
//     this.urlAvatar,
//     this.serviceId,
//     this.fcmToken,
//     this.docid,
//     this.lastMessage,
//     this.id,
//     this.bid_id,
//     this.job_id,
//     this.project_owner_user_id,
//     this.service_id,
//     this.userMobile,
//     this.lastMessageTime,
//   });
//
//   UserChat.fromMap(Map snapshot, String id)
//       : idd = id ?? '',
//         name = snapshot['name'] ?? '',
//         bid_id = snapshot['bid_id'] ?? '',
//         job_id = snapshot['project_id'] ?? '',
//         service_id = snapshot['service_id'] ?? '',
//         read = snapshot['read'] ?? '',
//         id = snapshot['recieveruserId']??'',
//         fcmToken = snapshot['token']?? '',
//         lastMessage = snapshot['lastMessage'] ?? '',
//         lastMessageTime = Utils.toDateTime(snapshot['lastMessageTime']),
//         block = snapshot['block'] ?? '',
//         serviceId = snapshot['serviceId']??'',
//         idUser = snapshot['idUser'] ?? '',
//         docid = snapshot['docid'] ?? '',
//         project_owner_user_id = snapshot['project_owner_user_id'] ?? '',
//         urlAvatar = snapshot['urlAvatar'] ?? '',
//         userMobile = snapshot['userMobile'] ?? '',
//         status = snapshot['status'] ?? '';
//
//   toJson() {
//     return {
//       "name": name,
//       'project_owner_user_id': project_owner_user_id,
//       "read": read,
//       'token':fcmToken,
//       'bid_id': bid_id,
//       'project_id': job_id,
//       'recieveruserId': id,
//       'serviceId': serviceId,
//       'service_bid': service_id,
//       'id': idd,
//       'lastMessage': lastMessage,
//       'lastMessageTime': Utils.toDateTime(lastMessageTime),
//       'block': block,
//       'idUser': idUser,
//       'docid': docid,
//       'urlAvatar': urlAvatar,
//       'userMobile': userMobile,
//       'status': status,
//     };
//   }
// }

import 'package:manager/backend/backend.dart';

class GigsModel {
  String id;
  final String gigTitle;
  final String gigDescription;
  final String postTime;
  final String gigType;
  final String salary;
  final String date;
  final String location;
  final String shortlocation;
  final String duration;
  final String managerName;
  final String contactName;
  final String contactCompany;
  final String contactMail;
  final String gigImage;
  final String managerPicture;



  GigsModel({
    this.id,
    this.gigTitle,
    this.gigDescription,
    this.gigType,
    this.managerName,
    this.managerPicture,
    this.gigImage,
    this.salary,
    this.shortlocation,
    this.postTime,
    this.contactCompany,
    this.contactMail,
    this.contactName,
    this.duration,
    this.date,
    this.location,
  });

  GigsModel.fromMap(Map snapshot, String id)
      : id = id ?? '',
        gigType = snapshot['gigType'] ?? '',
        gigDescription = snapshot['gigDescription'] ?? '',
        gigTitle = snapshot['gigTitle'] ?? '',
        managerPicture = snapshot['managerPicture'] ?? '',
        managerName = snapshot['managerName'] ?? '',
        postTime = snapshot['postTime']??'',
        gigImage = snapshot['gigImage']??"",
        location = snapshot['location']?? '',
        salary = snapshot['salary'] ?? '',
        shortlocation = snapshot['shortlocation'],
        duration = snapshot['duration']??'',
        contactMail = snapshot['contactMail']??'',
        contactName = snapshot['contactName'] ?? '',
        contactCompany = snapshot['contactCompany']??'',
        date = snapshot['date'] ?? '';

  toJson() {
    return {
      "name": gigTitle,
      'project_owner_user_id': gigDescription,
      "read": gigType,
      'token':managerName,
      'bid_id': managerPicture,
      'gigImage': gigImage,
      'project_id': date,
      'recieveruserId': duration,
      'id': id,
      'postTime': postTime,
      'location': location,
      'contactName': contactName,
      'contactCompany': contactCompany,
      'contactMail': contactMail,
      'salary': salary,
      'shortlocation': shortlocation,
    };
  }
}
