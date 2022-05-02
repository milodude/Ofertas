import 'package:dartz/dartz.dart';
import 'package:ofertas/features/login/domain/entities/user_data.dart';

import '../../../../core/error/failure.dart';

//Usar Either del paquete Dartz sirve para programacion funcional. Nos habilita a devolver Failure o User. No tenemos que andar
//usando try y catchs por todos lados. Si haces TDD empezas por aca y despues haces el codigo.
abstract class IUserRepository{
  Future<Either<Failure, UserData>> googleLogIn();
  Future<Either<Failure, void>?> googleLogOut();
}