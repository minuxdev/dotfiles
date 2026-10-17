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
