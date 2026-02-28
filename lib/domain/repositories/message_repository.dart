import 'package:zerochat/domain/entities/message_entity.dart';

abstract class MessageRepository {
  Future<void> send(MessageEntity message);  // i dont care just use this 
}