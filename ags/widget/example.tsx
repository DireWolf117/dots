import { Gtk, Widget } from "astal/gtk4"
import { Variable } from "astal"

const time = Variable("").poll(1000, "date +%H:%M")
const greeting = Variable("Welcome").poll(3600000, () => {
    const hour = new Date().getHours()
    if (hour < 12) return "Good morning"
    if (hour < 18) return "Good afternoon"
    return "Good evening"
})

export default function ExampleWidget() {
    return (
        <box orientation={Gtk.Orientation.VERTICAL} spacing={10}>
            <label 
                label={greeting()}
                cssClasses={["rectangle-title"]}
                halign={Gtk.Align.CENTER}
            />
            <label 
                label={time()} 
                cssClasses={["rectangle-time"]}
                halign={Gtk.Align.CENTER}
            />
            <Gtk.Button label="Click me" onClicked={() => print("Button clicked!")} />
        </box>
    )
}

// It's good practice to define props for your widget
type MyWidgetProps = {
  text: string;
};

// Define your widget as a function that returns a Gtk.Widget
export const MyWidget = ({ text }: MyWidgetProps): Gtk.Widget => {
  return Widget.Label({
    className: 'my-widget',
    label: text,
  });
};