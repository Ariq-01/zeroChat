import '../entities/message_entity.dart';
import '../repositories/message_repository.dart';

class SendMessageUsecase {
  final MessageRepository repository;

  SendMessageUsecase(this.repository);

  Future<void> execute(MessageEntity message) async {
    // cek rule of bisni first 
    if (!message.isValid) {
      throw Exception('invalid messages');
    }

    // send to the abstarction cllass by x 
    return await repository.send(message);

  }
}