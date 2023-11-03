abstract class Env {
  factory Env.local() => Local._();
  factory Env.test() => Staging._();
  factory Env.prod() => Prod._();
  Env._();
  String get baseUrl;
}

class Local extends Env {
  Local._() : super._();
  @override
  String get baseUrl => 'local_url';
}

class Staging extends Env {
  Staging._() : super._();
  @override
  String get baseUrl => 'stg_url';
}

class Prod extends Env {
  Prod._() : super._();
  @override
  String get baseUrl => 'prod_url';
}
