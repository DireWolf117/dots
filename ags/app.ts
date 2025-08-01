import { App } from "astal/gtk3";
import { ApplicationLauncher } from "./widget/ApplicationLauncher";
import style from "./style.scss";
import { FloatingWindow } from "./widget/FloatingWindow";
import Bar from "./widget/Bar";

App.start({
  css: style,
  main() {
    // App.get_monitors().map(Bar);

    const content = "Welcome to Floating Window!";
    const title = "Floating Window";
    ApplicationLauncher();
  },
});
