from ranger.api.commands import *


class extract(Command):
    def execute(self):
        selected_files = self.fm.thistab.get_selection()
        if not self.arg(1) and not selected_files:
            self.fm.notify("No file selected.", bad=True)
            return
        self.fm.notify(self.arg(1))
        command = "atool --extract " + selected_files
        self.fm.execute_console(command)


class pack(Command):
    def execute(self):
        selected_files = self.fm.thistab.get_selection()
        if not self.arg(1) and not selected_files:
            self.fm.notify("No file selected.", bad=True)
            return
        file = self.arg(1)
        if not file:
            self.fm.notify("No filename provided.")

        self.fm.notify(file)
        command = f"atool -a {file} {selected_files} "
        self.fm.execute_console(command)
        self.fm.notify("%s were packed to %s" % selected_files % file)


class wallpaper(Command):
    def execute(self):
        selected_image = self.fm.thistab.get_selection()[0]
        if not selected_image:
            self.fm.notify("No image selected.")
            return

        command = f""" shell
        swww img {selected_image};
        notify-send -u low -t 4000 \
        '{selected_image} was set to background.';
        wal -q -i {selected_image} """
        self.fm.execute_console(command)
