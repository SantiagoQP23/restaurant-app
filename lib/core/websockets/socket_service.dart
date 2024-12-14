import 'dart:developer';
import 'package:restaurant_app/config/config.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketEvents {
  static const String newOrder = 'new-order';
  static const String orderCreated = 'create-order';
  static const String orderUpdated = 'update-order';
  static const String orderDeleted = 'delete-order';
  static const String tableUpdated = 'update-table';
  static const String updateOrderDetail = 'update-order-detail';
  static const String createBill = 'createBill';
  static const String updateBill = 'updateBill';
}

enum ServerStatus { online, offline, connecting }

class SocketService {
  String token = '';
  ServerStatus serverStatus = ServerStatus.connecting;
  SocketService();
  late IO.Socket socket;

  bool get isConnected => socket.connected;

  initConnection(token) {
    socket = IO.io(
        Environment.serverUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setExtraHeaders({'authentication': token})
            .disableAutoConnect()
            .build());
    if (token.isEmpty) {
      log('Token is empty');
      return;
    }
    socket.connect();
    socket.on('connection', (conn) {
      log('Connected to socket server ${conn.toString()}');
      serverStatus = ServerStatus.online;
    });
    log('Trying to connect to socket server');
    socket.onConnect((data) {
      log('Connected to socket server ${data.toString()}');
      serverStatus = ServerStatus.online;
    });
    socket.onDisconnect((data) {
      log('Disconnected from socket server ${data.toString()}');
      serverStatus = ServerStatus.offline;
    });
    socket.onError((error) {
      log('Error connecting to socket server: ${error.toString()}');
      serverStatus = ServerStatus.offline;
    });
  }

  closeConnection() {
    socket.disconnect();
    serverStatus = ServerStatus.offline;
  }
}
