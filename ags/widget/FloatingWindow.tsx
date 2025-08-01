import { Gtk } from "astal/gtk3";

export function FloatingWindow(title: string, content: string) {
    Gtk.init(null);

    const window = new Gtk.Window({ type: Gtk.WindowType.TOPLEVEL });
    window.set_title(title);
    window.set_default_size(400, 200);
    window.set_decorated(false);

    const label = new Gtk.Label();
    label.set_text(content);
    window.add(label);

    window.connect('destroy', () => Gtk.main_quit());
    window.show_all();
    Gtk.main();
}