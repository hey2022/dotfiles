;; org
(package! org :recipe
  (:host nil :repo "https://git.tecosaur.net/mirrors/org-mode.git" :remote "mirror" :fork
   (:host nil :repo "https://git.tecosaur.net/tec/org-mode.git" :branch "dev" :remote "tecosaur")
   :files
   (:defaults "etc")
   :build t :pre-build
   (with-temp-file "org-version.el"
     (require 'lisp-mnt)
     (let
         ((version
           (with-temp-buffer
             (insert-file-contents "lisp/org.el")
             (lm-header "version")))
          (git-version
           (string-trim
            (with-temp-buffer
              (call-process "git" nil t nil "rev-parse" "--short" "HEAD")
              (buffer-string)))))
       (insert
        (format "(defun org-release () \"The release version of Org.\" %S)\n" version)
        (format "(defun org-git-version () \"The truncate git commit hash of Org mode.\" %S)\n" git-version)
        "(provide 'org-version)\n"))))
  :pin nil)
(unpin! org)
(unpin! org-roam)
(package! org-node)
(package! org-node-fakeroam)
(package! org-roam-ui)
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

(package! mlog-mode
  :recipe (:host github :repo "hey2022/mlog-mode"))

(package! envrc)

(package! difftastic)

(package! catppuccin-theme)
