import { Gtk } from "astal/gtk3";
const GLib = imports.gi.GLib;

export function ApplicationLauncher() {
    Gtk.init(null);

    const window = new Gtk.Window({ type: Gtk.WindowType.TOPLEVEL });
    window.set_title("Application Launcher");
    window.set_default_size(400, 300);
    window.set_decorated(true);

    const input = new Gtk.Entry();
    input.set_placeholder_text("Type application name...");

    const button = new Gtk.Button({ label: "Launch" });

    button.connect("clicked", () => {
        const app = input.get_text();
        const [success, , stdout, stderr] = GLib.spawn_sync(
            null,
            ["/bin/bash", "/home/rialyze/.config/ags/scripts/launch_app.sh", app],
            null,
            GLib.SpawnFlags.SEARCH_PATH,
            null
        );

        if (!success) {
            print(`Error: ${stderr}`);
        }
    });

    const box = new Gtk.Box({ orientation: Gtk.Orientation.VERTICAL });
    box.pack_start(input, false, false, 5);
    box.pack_start(button, false, false, 5);

    window.add(box);
    window.connect("destroy", () => Gtk.main_quit());
    window.show_all();

    Gtk.main();
}