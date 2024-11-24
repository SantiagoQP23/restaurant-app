class SocketEvent<T> {
  final bool ok;
  final String msg;
  final T? data;

  SocketEvent({required this.ok, required this.msg, this.data});
  
}
