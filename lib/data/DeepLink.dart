

class DeepLink{
  final String pathName;

  DeepLink({
    required this.pathName
  });


  @override
  bool operator ==(Object o) {
    if (identical(this, o))
      return true;

    return o is DeepLink &&
      o.pathName == pathName;
  }

  @override
  int get hashCode => pathName.hashCode;
}