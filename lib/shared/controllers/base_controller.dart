import 'package:get/get.dart';
import 'package:strong_pass/core/data/models/status.dart';

abstract class BaseController<T> extends GetxController {
  final _status = Status.unknown.obs;
  final _list = <T>[].obs;
  final _message = ''.obs;

  Status get status => _status.value;
  List<T> get list => _list;
  String get message => _message.value;

  void setList(List<T> list) {
    _list(list);
    update();
  }

  void setStatus(Status status) {
    _status(status);
    update();
  }

  void setMessage(String message) {
    _message(message);
    update();
  }

  void reset() {
    _list([]);
    _status(Status.loading);
    _message('');
  }
}
