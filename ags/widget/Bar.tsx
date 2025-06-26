import { App, Astal, Gtk, Gdk } from "astal/gtk4"
import { Variable } from "astal"

const time = Variable("").poll(1000, "date +%H:%M")

// Check if layer shell is supported
const isLayerShellSupported = Variable(true)

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const monitorGeometry = gdkmonitor.get_geometry()
    
    return <window
        visible
        cssClasses={["Rectangle", "simple-rectangle"]}
        gdkmonitor={gdkmonitor}
        windowType="dock"
        exclusive={false}
        focusable={false}
        monitor={0}
        width={300}
        height={200}
        resizable={false}
        skipTaskbarHint={true}
        decorated={false}
        defaultWidth={300}
        defaultHeight={200}
        margins={[0, 0, 0, 0]}>
        <box 
            cssName="rectangle-box" 
            vexpand 
            orientation={Gtk.Orientation.VERTICAL}>
            <label 
                label="Simple Rectangle" 
                vexpand 
                valign={Gtk.Align.CENTER}
                halign={Gtk.Align.CENTER}
                cssClasses={["rectangle-title"]}
            />
            <label 
                label={time()} 
                valign={Gtk.Align.CENTER}
                halign={Gtk.Align.CENTER}
                cssClasses={["rectangle-time"]}
            />
        </box>
    </window>
}

