import { App } from "astal/gtk4"
import style from "./style.scss"
import SelectableListWindow from "./widget/selector"


// Create a SelectableListWindow for each monitor
const selectorWindows = App.get_monitors().map(SelectableListWindow)

// Export the windows for ags to use
export default {
  windows: selectorWindows,
};

App.start({
    css: style,
    instanceName: "js",
    requestHandler(request, res) {
        print(request)
        res("ok")
    },
    main: () => selectorWindows,
})