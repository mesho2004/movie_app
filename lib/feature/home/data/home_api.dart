class HomeApi {
  Future<List<String>> fetchHighlights() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return ['Popular 1', 'Popular 2', 'Popular 3'];
  }
}
