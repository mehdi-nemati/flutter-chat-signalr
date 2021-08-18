String removeMessageExtraChar(String userText) {
  String editedUserText = userText;
  for (;;) {
    if (editedUserText.endsWith('\n')) {
      editedUserText = editedUserText.substring(editedUserText.length - 1);
    } else if (editedUserText.endsWith(' ')) {
      editedUserText = editedUserText.substring(editedUserText.length - 1);
    } else if (editedUserText.startsWith(' ')) {
      editedUserText = editedUserText.substring(1);
    } else
      break;
  }
  return editedUserText;
}
