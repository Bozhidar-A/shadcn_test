part of shadcn_ui_example;

void ShowSimpleToastWithText(BuildContext context, String text) {
  ShadToaster.of(context).show(
    ShadToast(
      description: Text(text),
    ),
  );
}

void ShowToastWithTitleAndText(
    BuildContext context, String title, String text) {
  ShadToaster.of(context).show(
    ShadToast(
      title: Text(title),
      description: Text(text),
    ),
  );
}
