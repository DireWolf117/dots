import { App, Astal, Gtk, Gdk } from "astal/gtk4"
import { Variable } from "astal"

// A variable to hold the currently selected item's name
const selectedItem = Variable("None")

// An array of items for our list
const items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

export default function SelectableListWindow(gdkmonitor: Gdk.Monitor) {
    return <window
        visible
        cssClasses={["Rectangle", "simple-rectangle"]}
        gdkmonitor={gdkmonitor}
        windowType="dock"
        exclusive={false}
        focusable={true} // Allow the window to be focused to interact with the list
        monitor={0}
        width={300}
        height={400}
        resizable={false}
        skipTaskbarHint={true}
        decorated={false}
        defaultWidth={300}
        defaultHeight={400}
        margins={[0, 0, 0, 0]}>
        <box
            cssName="rectangle-box"
            vexpand
            orientation={Gtk.Orientation.VERTICAL}
            spacing={10}
            css="padding: 10px;"
        >
            <label
                label="Select an Item"
                vexpand={false}
                valign={Gtk.Align.START}
                halign={Gtk.Align.CENTER}
                cssClasses={["rectangle-title"]}
            />
            <scrolledwindow
                hexpand
                vexpand
                hscrollbarPolicy={Gtk.PolicyType.NEVER}
                vscrollbarPolicy={Gtk.PolicyType.AUTOMATIC}>
                <listbox
                    hexpand
                    vexpand
                    selectionMode={Gtk.SelectionMode.NONE} // We handle selection manually
                    cssClasses={["my-list"]}
                >
                    {items.map(item => (
                        <listboxrow
                            selectable={false} // We use a button for selection
                        >
                            <button
                                hexpand
                                onPrimaryClick={() => selectedItem.value = item}
                                cssClasses={["list-item-button"]}
                            >
                                <label label={item} />
                            </button>
                        </listboxrow>
                    ))}
                </listbox>
            </scrolledwindow>
            <box
                orientation={Gtk.Orientation.HORIZONTAL}
                halign={Gtk.Align.CENTER}
                spacing={5}
                css="margin-top: 10px;"
            >
                <label
                    label="Selected:"
                    vexpand={false}
                    valign={Gtk.Align.CENTER}
                />
                <label
                    label={selectedItem.bind()}
                    vexpand={false}
                    valign={Gtk.Align.CENTER}
                    cssClasses={["selected-item-label"]}
                />
            </box>
        </box>
    </window>
}