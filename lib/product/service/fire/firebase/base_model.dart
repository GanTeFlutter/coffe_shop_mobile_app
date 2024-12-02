class BaseFirebaseModel<T> {
  BaseFirebaseModel({
    required this.id,
    required this.data,
  });
  final String id;
  final T? data;
}
