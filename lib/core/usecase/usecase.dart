import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movies_db/core/errors/failures.dart';

abstract class UseCase<Type, NoParams> {
  Future<Either<Failure, Type>> call(NoParams params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
