from aqt import gui_hooks, mw


def add_shortcut(state, shortcuts):
    if state == "review":
        shortcuts.append(("Ctrl+Shift+E", mw.onEmptyCards))


gui_hooks.state_shortcuts_will_change.append(add_shortcut)
