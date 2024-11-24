import 'package:restaurant_app/features/shared/domain/entities/socket_event.dart';

class SocketEventMapper {
  static SocketEvent fromJson(Map<String, dynamic> json) {
    return SocketEvent(
      ok: json['ok'] ?? false,
      msg: json['msg'],
      data: json['data'],
    );
  }

  // static Map<String, dynamic> toJson(SocketEvent event) {
  //   return {
  //     'type': event.type,
  //     'data': event.data,
  //   };
  // }
}