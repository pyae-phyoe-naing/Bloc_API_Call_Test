Future<String> getData({required String key}) async {
  if (key == 'xxx') {
    await Future.delayed(const Duration(seconds: 3));
    return 'Data get from API';
  } else {
   return await Future.delayed(const Duration(seconds: 3), () => Future.error('Something wrong'));
  }
}
