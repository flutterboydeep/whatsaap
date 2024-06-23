enum MessageEnum {
  text('text'),
  image('image'),
  auido('auido'),
  video('video'),
  gif('gif');

  final String type;
  const MessageEnum(this.type);
}

extension ConvertMesaage on String {
  MessageEnum toEnum() {
    switch (this) {
      case 'audio':
        return MessageEnum.auido;
      case 'image':
        return MessageEnum.image;
      case 'text':
        return MessageEnum.text;
      case 'gif':
        return MessageEnum.gif;
      case 'video':
        return MessageEnum.video;
      default:
        return MessageEnum.text;
      // break;
      //  default:
    }

    // switch (this) {
    //   case 'audio':
    //     return MessageEnum.auido;
    //   case 'image':
    //     return MessageEnum.image;
    //   case 'text':
    //     return MessageEnum.text;
    //   case 'gif':
    //     return MessageEnum.gif;
    //   case 'video':
    //     return MessageEnum.video;
    //     defalult:
    //     return MessageEnum.text;
    // }
  }
}
