import 'package:dartz/dartz.dart';
import 'package:t_truck_web/features/login/domain/repositories/i_token_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';

abstract class ITokenUseCase {
  Either<Failure, Map> call(Params params);
}

class TokenUseCase implements ITokenUseCase {
  final ITokenRepository tokenRepository;

  TokenUseCase({required this.tokenRepository});

  @override
  Either<Failure, Map> call(Params params) {
    if (params.tokenParam?.token == null) {
      return Left(ValidationFailure(detail: 'Token não pode ser null'));
    }

    return tokenRepository.jwtDecode(params.tokenParam!.token).fold(
          (l) => Left(AppFailure()),
          (r) => Right(r),
        );
  }
}
