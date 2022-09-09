;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Marcin Mrugacz"
      user-mail-address "migacz85@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Custom
(setq
 projectile-project-search-path '("/home/migacz/projects/")
 )

(setq prettier-js-args '(
                        "--tab-width" "2"
                        "--single-quote"
                        ))
;; Run prettier on save
(setq prettier-js-mode 'non-nil)
;; Example of mapping
(map! :ne "SPC f b" #'prettier-js)

;; Org
(setq! org-directory "~/Notes/"
       org-todo-keywords '(("TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)" ))
                          )

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
;;(require 'smtpmail)
(setq user-mail-address "migacz85@gmail.com"
      user-full-name  "Marcin Mrugacz"
      mu4e-view-prefer-html t

      ;; I have my mbsyncrc in a different folder on my system, to keep it separate from the
      ;; mbsyncrc available publicly in my dotfiles. You MUST edit the following line.
      ;; Be sure that the following command is: "mbsync -c ~/.config/mu4e/mbsyncrc -a"
      mu4e-get-mail-command "mbsync -c /home/migacz/.config/mu4e/mbsyncrc -a"
      mu4e-update-interval  300
      mu4e-main-buffer-hide-personal-addresses t
      message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      mu4e-sent-folder "/gmail/Sent"
      mu4e-drafts-folder "/gmail/Drafts"
      mu4e-trash-folder "/gmail/Trash"
      mu4e-maildir-shortcuts
      '(("/gmail/Inbox"      . ?i)
        ("/gmail/Sent Items" . ?s)
        ("/gmail/Drafts"     . ?d)
        ("/gmail/Trash"      . ?t)))

;; (load "~/.doom.d/email")

;;extra

(defvar my-mu4e-account-alist
  '(("private"
     (user-mail-address  "migacz85@gmail.com")
     (user-full-name     "Marcin Mrugacz")
     (mu4e-sent-folder   "/gmail/Sent Items")
     (mu4e-drafts-folder "/gmail/Drafts")
     (mu4e-trash-folder  "/gmail/Deleted Items")
     (mu4e-refile-folder "/gmail/Archive"))
    ("work"
     (user-mail-address  "work@domain.net")
     (mu4e-sent-folder   "/work/Sent Items")
     (mu4e-drafts-folder "/work/Drafts")
     (mu4e-trash-folder  "/work/Deleted Items")
     (mu4e-refile-folder "/work/Archives"))))


(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))
(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(setq mu4e-html2text-command 'mu4e-shr2text)

;; (map! :leader
;;       :desc "Copy to register"
;;       "r c" #'copy-to-register
;;       :leader
;;       :desc "Frameset to register"
;;       "r f" #'frameset-to-register
;;       :leader
;;       :desc "Insert contents of register"

;;       :leader
;;       :desc "Jump to register"
;;       "r j" #'jump-to-register
;;       :leader
;;       :desc "List registers"
;;       "r l" #'list-registers
;;       :leader
;;       :desc "Number to register"
;;       "r n" #'number-to-register
;;       :leader
;;       :desc "Interactively choose a register"
;;       "r r" #'counsel-register
;;       :leader
;;       :desc "View a register"
;;       "r v" #'view-register
;;       :leader
;;       :desc "Window configuration to register"
;;       "r w" #'window-configuration-to-register
;;       :leader
;;       :desc "Increment register"
;;       "r +" #'increment-register
;;       :leader
;;       :desc "Point to register"
;;       "r SPC" #'point-to-register)



;; ;; https://github.com/prettier/prettier-emacs
;; (use-package prettier-js
;;   )

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with

;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
