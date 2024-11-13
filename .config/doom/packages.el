;; org
(unpin! org-roam)
(package! org-roam-ui)
(package! org-fragtog)
(package! org-transclusion)
(package! org-remark)
(package! org-timeblock)
(package! org-auto-tangle)
(package! org-modern)
(package! org-super-agenda)
(package! anki-editor
  :recipe (:host github :repo "anki-editor/anki-editor"))

(package! affe)

(package! copilot
  :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el")))
