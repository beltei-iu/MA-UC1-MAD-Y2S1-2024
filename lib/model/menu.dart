
// Manual serialize
// class Menu {
//
//   int? id;
//   String? name;
//   String? nameKh;
//   String? iconUrl;
//
//   Menu({this.id, this.name, this.nameKh, this.iconUrl});
//
//   // Create serialize function
//   Map<String, dynamic> toJson(){
//     return {
//       "id": this.id,
//       "name": this.name,
//       "nameKh":this.nameKh,
//       "iconUrl":this.iconUrl
//     };
//   }
//
//   // Create Deserialize function
//   factory Menu.fromJson(Map<String,dynamic> json){
//     int id = json["id"] ?? 0;
//     String name = json["name"] ?? "";
//     String nameKh = json["nameKh"] ?? "";
//     String iconUrl = json["iconUrl"] ?? "";
//     final menu = Menu(id: id, name: name, nameKh: nameKh, iconUrl: iconUrl);
//     return menu;
//   }
// }

// Auto serialize

import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable(explicitToJson: true)
class Menu {

  int? id;
  String? name;
  String? nameKh;
  @JsonKey(name: "iconUrl")
  String? icon;

  Menu({this.id, this.name, this.nameKh, this.icon});

  Map<String, dynamic> toJson() => _$MenuToJson(this);

  factory Menu.fromJson(Map<String,dynamic> json) => _$MenuFromJson(json);
}
