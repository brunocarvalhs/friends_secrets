import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/groups/domain/entities/logged_type_info.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/type_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';

class TypesRepositoryImpl extends TypesRepository {
  final NetworkDataSource datasource;

  TypesRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Iterable<LoggedTypeInfo>>> all() async {
    try {
      final response = await datasource.get("/type");
      // var types = list.docs.map((element) => TypeModel.fromMap(element.data()));
      return Right([]);
    } catch (e) {
      return Left(ErrorCreate(message: "Error ao tentar criar Groupo"));
    }
  }
}
