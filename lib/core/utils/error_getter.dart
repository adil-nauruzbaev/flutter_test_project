String errorToString(Object? error) => errorToStringList(error).first;

Set<String> errorToStringList(Object? error) {
  switch (error) {
    default:
      return {'Что-то пошло не так'};
  }
}
