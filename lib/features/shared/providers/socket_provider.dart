import 'dart:developer';

import 'package:restaurant_app/core/websockets/socket_service.dart';
import 'package:restaurant_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'socket_provider.g.dart';

@Riverpod(keepAlive: true)
SocketService socketInstance(SocketInstanceRef ref) {
  final accessToken = ref.watch(authProvider).token ?? '';
  final socketService = SocketService();
  if (accessToken.isEmpty) {
    log('Token is empty');
    return socketService;
  }
  socketService.initConnection(accessToken);
  return socketService;
}
