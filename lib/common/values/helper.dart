class Helper {
  Helper._();

  static int timestamp() => DateTime.now().microsecondsSinceEpoch;

  static bool isEmpty(dynamic data) {
    if (data == null) return true;

    if (data is String || data is Map || data is List) {
      return data.isEmpty;
    }

    return false;
  }

  static bool contains(Object? source, List<dynamic> elements) {
    if (isEmpty(source)) return false;
    if (source is Map) {
      for (var value in elements) {
        if (source.containsKey(value)) {
          return true;
        }
      }
    } else if (source is Iterable) {
      for (var value in elements) {
        if (source.contains(value)) {
          return true;
        }
      }
    } else if (source is String) {
      for (var value in elements) {
        if (source.contains(value)) {
          return true;
        }
      }
    }
    return false;
  }
}
