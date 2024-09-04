abstract class UseCase<Successtype, Params> {
  Future<Successtype> call(Params params);
}

abstract class UseCaseNoParmas<Successtype> {
  Future<Successtype> call();
}

abstract interface class UseCaseGet<Successtype> {
  Future<Successtype> call();
}
