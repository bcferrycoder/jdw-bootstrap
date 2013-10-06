
; Swap ^x and ^q
; 021 is C-Q
; 030 is C-X

(defun swap ()
  (interactive)
  (progn
   (setq keyboard-translate-table (make-string 128 0))
   (let ((i 0))
     (while (< i 128)
       (aset keyboard-translate-table i i)
       (setq i (1+ i))))
   (aset keyboard-translate-table ?\^x ?\^q)
   (aset keyboard-translate-table ?\^q ?\^x)))


;(defun del-swap ()
;  (interactive)
;  (progn
;   (setq keyboard-translate-table (make-string 128 0))
;   (let ((i 0))
;     (while (< i 128)
;       (aset keyboard-translate-table i i)
;       (setq i (1+ i))))
;   (aset keyboard-translate-table ?\^x ?\^q)
;   (aset keyboard-translate-table ?\^q ?\^x)
;   (aset keyboard-translate-table ?\C-h ?\C-?)
;   (aset keyboard-translate-table ?\C-? ?\C-h)))

;(if (or
;     (getenv "DISPLAY")
;     (= 0 (call-process "/home/ace_admin/williams/bin/isquiche")))
;    (swap))

;(defun modem ()
;  (interactive)
;  (display-time)
;  (setq baud-rate 19200))

;(defun home ()
;  (interactive)
;  (display-time)
;  (setq baud-rate 9600)
;  (swap))

(setq load-path (cons (expand-file-name "~/local/emacs/public") load-path))
(setq load-path (cons (expand-file-name "~/local/emacs/public/vm") load-path))

(if (string= (system-name) "skyler.arc.ab.ca")
    (progn
      (setq load-path (cons "/opt/gnu/lib/emacs/contrib/efs-1.14" load-path))
      (require 'efs)))

; (setq-default case-fold-search nil)

; (if (= 0 (call-process "/home/ace_admin/williams/bin/ismodem"))
;     (home))


;(setq load-path (cons (expand-file-name "~/emacs/local") load-path))
;(setq load-path (cons (expand-file-name "~/emacs/public") load-path))

(define-key esc-map "g" 'goto-line)
(define-key ctl-x-map "=" 'what-line)
; (define-key ctl-x-map "" 'rmail)
; (setq rmail-primary-inbox-list (list (expand-file-name "~/m/inbox")))
; (setq rmail-file-name (expand-file-name "~/m/rmail"))
(setq rmail-default-rmail-file (expand-file-name "~/m/tmp"))
(setq rmail-last-rmail-file (expand-file-name "~/m/tmp"))
;(setq mail-archive-file-name (expand-file-name "~/m/tout"))
; (setq mail-default-reply-to "williams@skyler.arc.ab.ca")

(setq vm-folder-directory (expand-file-name "~/john/MailArchive/"))

(define-key ctl-x-map "t" 'shell)
(define-key ctl-x-map "c" 'compare-windows)

;; aftp, tel, now, todo, progress, realias, insert-my-name
; (load (expand-file-name "~/.mailaliases.el") nil t t)
; (autoload 'dvo "dvo" "Use dvorak keyboard" t nil)
; (autoload 'un-dvo "dvo" "Un-use dvorak keyboard" t nil)

(autoload 'gnus "gnus" "Gnus News Reader" t)
(autoload 'perl-mode "perl-mode" "Perl Mode" t)
(autoload 'insert-patterned "patn-insert" "Insert a pattern." t)

;(fmakunbound 'c-mode)
;(makunbound 'c-mode-map)
;(fmakunbound 'c++-mode)
;(makunbound 'c++-mode-map)
;(makunbound 'c-style-alist)
;(autoload 'c++-mode "cc-mode" "C++ Editing Mode" t)
;(autoload 'c-mode "cc-mode" "C Editing Mode" t)

(autoload 'vkill "vkill" nil t)
; (autoload 'list-unix-processes "vkill" nil t)

(autoload 'balance-windows "bal-wins" "balance window sizes" t nil)
(autoload 'mail-verify "mail-verify" "Verify mail address for users." t)
(autoload 'sgml-mode "psgml" "psgml mode" t)
;(setq load-path (cons (expand-file-name "~/sgml/psgml/unpack") load-path))

(autoload 'ksh-mode "ksh-mode" "Major mode for editing sh Scripts." t)
(setq ksh-mode-hook
      (function (lambda ()
		  (setq ksh-indent 4)
		  (setq ksh-group-indent (- 0 ksh-indent))
		  (setq ksh-case-item-indent 1)
		  (setq ksh-case-indent 6)
		  (setq ksh-brace-indent 0)   
		  (setq ksh-match-and-tell t)
		  )))

(setq auto-mode-alist (append (list (cons "\\.pl$" 'perl-mode)
				    (cons "\\.perl$" 'perl-mode)
				    (cons "\\.awk$" 'awk-mode)
				    (cons "\\.otl$" 'outline-mode)
				    (cons "\\.self$" 'self-mode)
				    (cons "\\.sh$" 'ksh-mode)
				    (cons "\\.h$" 'c++-mode)
				    (cons "\\.hxx$" 'c++-mode)
				    (cons "\\.cxx$" 'c++-mode)
				    )
			      auto-mode-alist))

(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)
(setq backup-by-copying-when-linked t)
(setq truncate-partial-width-windows t)
(setq make-backup-files nil)
(setq require-final-newline t)
(setq max-lisp-eval-depth 300)
(put 'eval-expression 'disabled nil)

;; CMU-shell
;; ^M's: tcsh: 'unset edit', csh 'stty -echo nl' - don't work completely.

; (setq explicit-shell-file-name "/usr/local/bin/tcsh")

; (setq shell-prompt-pattern "^[^#$%>)]*[#$%>)] *")

;(setq shell-prompt-pattern "^skyler. ")

; (setq shell-prompt-pattern "^[a-z]* ([0-9]*) ")
;(setq comint-prompt-regexp shell-prompt-pattern)

(setq shell-popd-regexp "pp\\\|popd")
(setq shell-pushd-regexp "pd\\\|pushd")

; (setq cmushell-load-hook
;       (function (lambda () 
; 	  (define-key cmushell-mode-map "\t" 'comint-dynamic-complete)
; 	  (define-key cmushell-mode-map "\M-\t"
; 	    'comint-dynamic-list-completions)
; 	  (define-key cmushell-mode-map "\C-x\C-w" 'view-file)
; 	  (setq input-ring-size 50)
; 	  ;; (require 'comint-isearch)
; 	  ;; (define-key cmushell-mode-map "\C-r" 'comint-isearch)
; 	  )))


; (add-hook 'mail-yank-hooks 'sc-cite-original)
; (add-hook 'mail-citation-hook 'sc-cite-original)
; (setq news-reply-header-hook nil)
; (autoload 'sc-cite-original "sc" "Supercite" t)

; (defun my-supercite-hook ()
;   (setq sc-auto-fill-region-p nil)
;   (setq sc-nested-citation-p t)
;   (setq sc-citation-leader "")
;   (setq sc-confirm-always-p nil)
;   (setq sc-electric-references-p nil)
;   (setq sc-nuke-mail-headers 'specified)
;   (setq sc-nuke-mail-header-list
; 	(list "x-mailer"
; 	      "mime-version"
; 	      "content-type"
; 	      "content-transfer-encoding"
; 	      "X-Sender"
; 	      "X-VMS-Cc"
; 	      "X-VMS-To"
; 	      "To"
; 	      "cc"
; 	      "Date"
; 	      "From"
; 	      "content-length"
; 	      "In-Reply-To"
; 	      "References"
; 	      "Resent-To"
; 	      "Resent-Date"
; 	      "Resent-From"
; 	      "Return-receipt-to"
; 	      "Received"
; 	      "mailer")))
; (add-hook 'sc-load-hook 'my-supercite-hook)

; (add-hook 'mail-setup-hook 'mail-abbrevs-setup)
(add-hook 'mail-setup-hook 'mail-abbrevs-setup)

; Metamail support
; (setq
;  rmail-show-message-hook
;  '(lambda()
; 	 (rmail-check-content-type)))
; (load "metamail.el")

; TM5.1
; (setq load-path (cons (expand-file-name "~/emacs/src/tm5.1") load-path))
; (load "tm-setup")


; workaround for a bug sending mail from the indigo...
; (setq sendmail-program (expand-file-name "~/emacs/mysendmail"))
; (setq sendmail-program (expand-file-name "~/emacs/mysendmail.skyler"))

; (setq gnus-nntp-server "news-lhd")
; (setq gnus-nntp-server "engnews1")
; (setq gnus-local-domain "eng.sun.com")
(setq gnus-local-organization "JavaSoft, Sun Microsystems Inc.")

;; Gnus
; (setq gnus-large-newsgroup 200)
; (setq gnus-auto-center-subject nil)
; (setq gnus-optional-headers nil)
; (setq gnus-nntp-server "hp")
; (setq gnus-your-domain "cuug.ab.ca")
; (setq gnus-your-organization "Calgary Unix User's Group")
; (setq gnus-user-login-name "wetheril")
; (setq gnus-user-full-name "John Wetherill")
; (setq gnus-startup-file "/homes/gws/williams/.newsrc-beaver")
; (setq gnus-ignored-headers
;       (concat 
;       "^Path:\\|^Posting-Version:\\|^Article-I.D.:\\|^Expires:"
;       "\\|^Date-Received:\\|^Control:\\|^Xref:\\|^Lines:\\|^Posted:"
;       "\\|^Relay-Version:\\|^Message-ID:\\|^Nf-ID:\\|^Nf-From:"
;       "\\|^Approved:\\|^Sender:\\|^Nntp-Posting-Host:\\|Nntp-Posting-User:"
;       "\\|^Originator:\\|^References:"
;       "\\|^X-Musical-Quote[0-9]*:\\|^X-Adverti[sz]ement:"
;       "\\|^X-Quote.*:\\|^X-Vms.*:\\|^Content-.*:\\|^Resent-.*:\\|^Errors-To:"
;       "\\|^X-[Bb]ecause:\\|^X-Disclaimer:"
;       "\\|^X-Newsreader:"
;       "\\|^Date:"
;       "\\|^Distribution:"
;       "\\|^Reply-to:"
;       "\\|^X-.*[Vv]irus.*:"
;       "\\|^Mime-.*:\\|^Priority:\\|^Sensitivity:\\|^X-Organization:"
;       "\\|^X-Bart-Quote:\\|^Comments:"))

; (setq
;  gnus-Subject-mode-hook
;  (function
;   (lambda ()
;     (setq case-fold-search t))))

;(setq
; gnus-Select-group-hook
; (function
;  (lambda ()
;    (gnus-Subject-sort-by-subject nil) ;<-------the most
;    ;;importaint line, ought to be default...
;    (gnus-configure-windows 'SelectArticle)
;    (setq
;     gnus-auto-select-first
;     (and
;      (< (length gnus-newsgroup-unreads)
;	 (window-height (get-buffer-window gnus-Subject-buffer)))
;      ;;In sources groups I just want to see the subjects
;      (or (not (string-match "\\.sources" gnus-newsgroup-name))
;	  (string-match "\\.d$\\|\\.wanted$\\|\\.bugs$"
;			gnus-newsgroup-name))
;      )
;     )
;    )))

;(require 'crypt++)

; (setq mail-mode-hook
;       (function
;        (lambda ()
; 	 (define-key mail-mode-map "\M-s"
; 	   'insert-my-name))))
; 

;; letting Unix do it is faster:
(setq manual-formatted-dirlist nil)
; (setq Man-switches "-F")

(defun man-clean ()
  (interactive)
  (shell-command-on-region (point-min) (point-max)
			   "sed -e 's/.//g'" t)
  (goto-char (point-min)))
 
; (setq auto-save-interval 100)

; (defconst my-c-style
;   '("PERSONAL"
;     (c-tab-always-indent           . t)
;     (c-comment-only-line-offset    . 0)
;     (c-hanging-braces-alist        . ((substatement-open after)
; 				      (brace-list-open)))
;     (c-hanging-colons-alist        . ((member-init-intro before)
; 				      (inher-intro)
; 				      (case-label after)
; 				      (label after)
; 				      (access-label after)))
;     (c-cleanup-list                . (scope-operator
; 				      empty-defun-braces
; 				      defun-close-semi))
;     (c-offsets-alist               . ((arglist-close     . c-lineup-arglist)
; 				      (substatement-open . 0)
; 				      (case-label        . 0)
; 				      (block-open        . 0)
; 				      (knr-argdecl-intro . -)))
;     (c-echo-syntactic-information-p . t)
;     )
;   "My C Programming Style")

;;; Customizations for both c-mode and c++-mode
;(defun my-c-mode-common-hook ()
;  ;; set up for my perferred indentation style, but only do it once
;  (let ((my-style "PERSONAL"))
;    (or (assoc my-style c-style-alist)
;	(setq c-style-alist (cons my-c-style c-style-alist)))
;    (c-set-style my-style))
;  ;; offset customizations not in my-c-style
;  (c-set-offset 'member-init-intro '++)
;  (setq c-basic-offset 2)
;  ;; other customizations
;  (setq tab-width 8
;	;; this will make sure spaces are used instead of tabs
;	indent-tabs-mode nil)
;  ;; we like auto-newline and hungry-delete
;  (c-toggle-auto-hungry-state 1)
;  ;; keybindings for C, C++, and Objective-C.  We can put these in
;  ;; c-mode-map because c++-mode-map and objc-mode-map inherit it
;  (define-key c-mode-map "\C-m" 'newline-and-indent)
;  (define-key c-mode-map "\C-c\C-c" 'compile)
;  )

;;; the following only works in Emacs 19
;;; Emacs 18ers can use (setq c-mode-common-hook 'my-c-mode-common-hook)
;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;(add-hook 'c-mode-hook
;      (function
;       (lambda ()
;	 (modify-syntax-entry ?_ "w" c-mode-syntax-table))))

(setq display-time-day-and-date t)
;(display-time)

; (setq load-path (cons (expand-file-name "~gnats/lib/emacs/lisp") load-path))

; (autoload 'edit-pr "gnats"
;   "Command to edit a problem report." t)
; (autoload 'view-pr "gnats"
;   "Command to view a problem report." t)
; (autoload 'unlock-pr "gnats"
;   "Unlock a problem report." t)
; (autoload 'query-pr "gnats"
;   "Command to query information about problem reports." t)
; (autoload 'send-pr-mode "send-pr"
;   "Major mode for sending problem reports." t)
; (autoload 'send-pr "send-pr"
;   "Command to create and send a problem report." t)

; (setq lpr-switches '("-h -m -Predbaron"))
; (setq lpr-add-options nil)


; (setq load-path (cons "/opt/gnu/share/emacs/contrib/w3" load-path))
; (autoload 'w3-preview-this-buffer "w3" "WWW Previewer" t)
; (autoload 'w3-follow-url-at-point "w3" "Find document at pt" t)
; (autoload 'w3 "w3" "WWW Browser" t)
; (autoload 'w3-open-local "w3" "Open local file for WWW browsing" t)
; (autoload 'w3-fetch "w3" "Open remote file for WWW browsing" t)
; (autoload 'w3-use-hotlist "w3" "Use shortcuts to view WWW docs" t)
; (autoload 'w3-show-hotlist "w3" "Use shortcuts to view WWW docs" t)
; (autoload 'w3-follow-link "w3" "Follow a hypertext link." t)
; (autoload 'w3-batch-fetch "w3" "Batch retrieval of URLs" t)
; (autoload 'url-get-url-at-point "url" "Find the url under the cursor" nil)
; (autoload 'url-file-attributes  "url" "File attributes of a URL" nil)
; (autoload 'url-popup-info "url" "Get info on a URL" t)
; (autoload 'url-retrieve   "url" "Retrieve a URL" nil)
; (autoload 'url-buffer-visiting "url" "Find buffer visiting a URL." nil)

; (autoload 'gopher-dispatch-object "gopher" "Fetch gopher dir" t)

; (setq w3-delay-image-loads t)

; (menu-bar-mode nil)
;(scroll-bar-mode -1)

(setq rlogin-process-connection-type t)
(setq rlogin-initially-track-cwd nil)

(setq calendar-latitude  (+ 51.0 (/ 3.0 60.0)))
(setq calendar-longitude (- -114.0 (/ 5.0 60.0)))
; (setq calendar-location-name "Calgary, AB")


;#########################################################
;#########################################################
;##                                                     ##
;##         start of mercury:~john/emacs, 1994          ##
;##                                                     ##
;#########################################################
;#########################################################



;; tell emacs where to find Gnews 

;(autoload 'Gnews "/Users/john/lisp/gnews/Init" "Gnews NNTP news reader" t nil)
(autoload 'vm "vm" "VM Mail." t)

;(setq load-path (cons "/usr/lib/emacs/lisp/next" load-path))
;(setq auto-mode-alist (cons '("\\.c\\+\\+" . c++-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.h" . c++-mode) auto-mode-alist))
(put 'eval-expression 'disabled nil)
;(setq rmail-file-name "~/Mailboxes/RMAIL")
; (add-hook 'mail-setup-hook
; 	  '(lambda ()
;	     (substitute-key-definition
;	      'next-line 'mail-abbrev-next-line
;	      mail-mode-map global-map)
;	     (substitute-key-definition
;	      'end-of-buffer 'mail-abbrev-end-of-buffer
;	      mail-mode-map global-map)))

;(add-hook 'mail-setup-hook 'mail-abbrevs-setup)
; (setq mail-archive-file-name (expand-file-name "~/john/MailArchive/OutGoing"))
(setq mail-self-blind t)

     (add-hook 'mail-setup-hook
               '(lambda ()
                  (substitute-key-definition
                    'next-line 'mail-abbrev-next-line
                    mail-mode-map global-map)
                  (substitute-key-definition
                    'end-of-buffer 'mail-abbrev-end-of-buffer
                    mail-mode-map global-map)))



; (split-window-vertically 25)

"these definitions added to ease the transtion from vi to emacs
I miss 'z.' 'zRET' 'z-' 'H' 'M' 'L' too much"

(defun this-line-to-top-of-screen (line)
  "Reposition line point is on to the top of the screen."
  (interactive "P")
  (recenter (if (null line)
		0
	      (prefix-numeric-value line))))

(defun this-line-to-center-of-screen (line)
  "Reposition line point is on to the center of the screen."
  (interactive "P")
  (recenter (if (null line)
		nil
	      (prefix-numeric-value line)))
)

(defun this-line-to-bottom-of-screen (line)
  "Reposition line point is on to the bottom of the screen."
  (interactive "P")
  (recenter (if (null line)
		-1
	      (prefix-numeric-value line)))
)

(defun H (line)
  "Move point to top of screen."
  (interactive "P")
  (move-to-window-line (if (null line)
			   0
			 (prefix-numeric-value line)))
)

(defun M (line)
  "Move point to center of screen."
(interactive "P")
  (move-to-window-line (if (null line)
			   nil
			 (prefix-numeric-value line)))
)

(defun L (line)
  "Move point to bottom of screen."
(interactive "P")
  (move-to-window-line (if (null line)
			   -1
			 (prefix-numeric-value line)))
)

(defun scroll-up-one-line (line)
  "scroll up one line"
  (interactive "P")
  (scroll-up (if (null line)
			   1
			 (prefix-numeric-value line)))
)

(defun scroll-down-one-line (line)
  "scroll down one line"
  (interactive "P")
  (scroll-down (if (null line)
			   1
			 (prefix-numeric-value line)))
)

(defun shrink-window-n-lines (line)
  "wrapper for shrink window"
  (interactive "P")
  (shrink-window (if (null line)
			   1
			 (prefix-numeric-value line)))
)

(defun grow-window-n-lines (line)
  "wrapper for shrink window"
  (interactive "P")
  (shrink-window (if (null line)
			   -1
			 (prefix-numeric-value (- line))))
)

(defun clear-buffer ()
  "Clear buffer."
  (interactive)
  (delete-region (point-min) (point-max))
  (comint-send-input)
)

(fset 'clear-buffer-to-this-line
   "\C-u\C-a\C-[<\C-w\C-e")


;(defun clear-buffer-to-this-line ()
;  "Clear buffer to this line."
;  (interactive)
;  (beginning-of-line)
;  (delete-region (point-min) (point))
;  (end-of-line)
;)




(defun seven-down ()
  "Cursor down seven lines."
  (interactive)
  (forward-line 7)
)

(defun seven-up ()
  "Cursor up seven lines."
  (interactive)
  (forward-line -7)
)


(defun gone ()
  "Gone for lunch."
  (interactive)
  (switch-to-buffer "gone")
  (delete-other-windows)
  (toggle-read-only 1)
  (message "out to lunch")
)

(defun fmt-region ()
  "Format region."
  (interactive)
  (shell-command-on-region (point) (mark) "fmt" t))

(defun wc-region ()
  "word-count region."
  (interactive)
  (shell-command-on-region (point) (mark) "wc -w" nil))

(defun shell-other-window ()
  "Split window, run shell in other window."
  (interactive)
  (split-window-vertically)
  (other-window 1)
  (shell)
)

(defun next-logs-entry ()
  "Place next logs entry on top of window."
  (interactive)
  (forward-char)
  (re-search-forward "^[A-Z]")
  (recenter 0)
  (beginning-of-line)
)

(defun goto-root ()
  "Switch to root buffer."
  (interactive)
  (switch-to-buffer "root")
)

(defun goto-skyler ()
  "Switch to skyler buffer."
  (interactive)
  (switch-to-buffer "skyler")
)

(defun goto-vm ()
  "Switch to rmail buffer."
  (interactive)
  (switch-to-buffer "INBOX Summary")
)

(defun goto-tail ()
  "Switch to tail buffer."
  (interactive)
  (switch-to-buffer "tail")
)



;; keyboard macros (soon to be rewritten in lisp)

(fset 'cout-start
   [1 15 tab 99 111 117 116 32 60 60 32 34])
(fset 'cout-end
      "\C-e<< '\\n' << flush;")
(fset 'commentout-region
   "\C-o#endif\C-x\C-x\C-a#if 0\C-m\C-x\C-x")
(fset 'commentout-line
      "\C-a// ")
(fset 'uncommentout-line
      "\C-a\C-d\C-d")
;(fset 'inventor-include
;      "\C-a\C-o#include <Inventor/")
(fset 'yank-line
   [1 4194336 14 8388728 107 105 108 108 45 114 105 110 103 45 115 97 118 101 return])
(fset 'enscript-region
   [3 3 83 99 97 116 32 62 32 47 116 109 112 47 106 117 110 107 return])
(fset 'c-comment
   [1 15 tab 47 42 return 42 tab return tab 42 47 16 5 32 60 60 32 67 79 77 77 69 78 84 83 32 72 69 82 69 32 62 62 8388706 8388706 2 2 2])
;(fset 'pft-region-old
;   "/A?pft1jA")
;(fset 'pft-region
;   "/A?cat /Users/john/Music/PFT/pft.preamble.ps /Users/john/Music/PFT/transcribe.ps - /Users/john/Music/PFT/pft.postamble.ps | pft1jA")

(fset 'swap-windows
   [24 111 24 98 return 24 111 24 98 return 24 111 24 98 return])

(fset 'horizontal-line
      "\C-u42-\C-m")

(fset 'strip-email-address
   "\C-s:\C-@\C-@\C-a\C-w\C-d\C-n\C-s\C-s\C-@\C-a\C-w\C-p\C-e\C-d\C-e <\C-semail:\C-[\C-w\C-w\C-d\C-e>\C-@\C-[>\C-w")


(fset 'quote-word
   [?\C-f escape ?b ?` escape ?f ?'])

(fset 'split-3
   "\C-x2\C-u9\C-[xshri w \C-m\C-xo\C-x2")

(fset 'fttd
   "\C-x\C-f/home/httpd/htdocs/wetherill.net/www/jg/ttd2.html\C-m")

(fset 'check
   "\C-sBOX\"\C-f\C-b checked\C-a\C-n")

(fset 'insert-ttd
   "\C-o<br><input type=\"CHECKBOX\">")

(defalias 'goto-TTD
  (read-kbd-macro "C-x C-f /glencan/home/jdw/doc/T TD.txt RET"))

(defalias 'goto-delicious
  (read-kbd-macro "C-x C-f /glencan/home/jdw/doc/d elicious.txt RET"))


(defalias 'begin-forwarded-message (read-kbd-macro
"C-a C-o C-u 15- SPC Begin SPC Forwarded SPC Message SPC C-u 15- C-a C-n C-o"))

(defalias 'end-forwarded-message (read-kbd-macro
"C-a C-o C-u 16- SPC End SPC Forwarded SPC Message SPC C-u 16- C-a"))


;  html macros
(fset 'ht-head
   "<HTML>\C-m<HEAD>\C-m   <TITLE></TITLE>\C-m</HEAD>\C-m\C-m<BODY>\C-m\C-m\C-m\C-m</BODY>\C-m</HTML>\C-rE>\C-r\C-f\C-f")

(fset 'web-object
   "<WEBOBJECT NAME=\"\"></WEBOBJECT>\C-r\"\C-@")

(fset 'applet
   "<applet code=\"\" width=200 height=200></applet>\C-r\"\C-@")

(fset 'Web-object
   "</WEBOBJECT>")

(fset 'comment-html
   "\C-a\C-f!--\C-e\C-b--\C-a")

(fset 'uncomment-html
   "\C-a\C-f\C-d\C-d\C-d\C-e\C-b\C-b\C-b\C-d\C-d\C-a")

(fset 'make-html-dd-list
   "\C-sQ:\C-a\C-m<dt><h4>\C-e</h4>\C-m<dd>\C-a\C-n")

(defalias 'html-link
  (read-kbd-macro "C-w <A SPC HREF=\" C-y \"> C-y <./ C-h C-h /A>"))


(defalias 'build-html-links
  (read-kbd-macro "C-a <A SPC HREF=\" C-k C-y \"> C-y </A><BR> C-a C-n"))

(defalias 'html-bold
  (read-kbd-macro "C-q < C-q b C-q >"))

(defalias 'html-unbold
  (read-kbd-macro "C-q < C-q / C-q b C-q >"))

(defalias 'html-h1
  (read-kbd-macro "<H 1></H1> TAB 5*C-b"))

(defalias 'html-h2
  (read-kbd-macro "<H 2></H2> TAB 5*C-b"))

(defalias 'html-h3
  (read-kbd-macro "<H 3></H3> TAB 5*C-b"))

(defalias 'html-h4
  (read-kbd-macro "<H 4></H4> TAB 5*C-b"))

(defalias 'html-h5
  (read-kbd-macro "<H 5></H5> TAB 5*C-b"))

(defalias 'html-lit
  (read-kbd-macro "ESC x delete-horizontal-space RET TAB <LI>"))


(defalias 'html-ulplain
  (read-kbd-macro "<UL SPC PLAIN> TAB RET"))

(defalias 'html-endul
  (read-kbd-macro "</UL> TAB RET"))


; temp macros for cleaning up FAQs
(fset 'kill-head
   "\C-s<!doc\C-a\C-[<\C-w")

(fset 'kill-tail
   "\C-s<hr>\C-a\C-[>\C-w")



;macros for objectplan database management

(fset 'append-op-db
   "\C-[|rsh salmon 'pbf >> /Homes/john/ObjectPlan/Beta/BetaAll/BetaAll'\C-m")

(fset 'append-jp-db
   "\C-[|rsh salmon 'pbf >> /Homes/john/JavaPlan/Beta/BetaSitesDB'\C-m")

; more macros...

(fset 'check-mail
   "\C-c\C-x\C-ryes\C-m")

; (fset 'respond-forjohn
;   [?\C-s ?F ?r ?o ?m ?: ?\C-f ?\C-  ?\C-e ?\C-c ?\C-x ?\C-k ?f ?\C-y ?\C-s ?- ?- ?- ?- ?- ?\C-e return ?H ?i ?, ?  ?f ?o ?r ?  ?s ?o ?m ?e ?  ?r ?e ?a ?s ?o ?n ?  ?t ?h ?i ?s ?  ?e ?m ?a ?i ?l ?  ?w ?a ?s ?  ?i ?n ?c ?o ?r ?r ?e ?c ?t ?l ?y ?  ?d ?e ?l ?i ?v ?e ?r ?e ?d ?  ?t ?o ?  ?m ?e ?  ?( ?j ?o ?h ?n ?@ ?e ?n ?g ?) ?. ?  backspace return return ?J ?o ?h ?n ?  ?W ?e ?t ?h ?e ?r ?i ?l ?l return return])

(fset 'respond-forjohn
   [(meta <) (control space) (meta >) (control c) (control x) (control k) (meta <) r H i \, space f o r space s o m e space r e a s o n space t h i s space e m a i l space w a s space i n c o r e e backspace backspace r e c t l y space d e l i v e r e d space t o space m e space \( j o h n @ e n g \) \. return return J o h n space W e t h e r i l l return return (control y) (meta <)])

(fset 'respond-for-john
   [?\M-< ?\M-> ?\M-w ?r ?\C-y ?\M-< ?\C-\M-n ?\C-p ?\C-o ?\C-o ?\C-o ?H ?i ?, ?  ?f ?o ?r ?  ?s ?o ?m ?e ?  ?r ?e ?a ?s ?o ?n ?  ?t ?h ?i ?s ?  ?e ?m ?a ?i ?l ?  ?w ?a ?s ?  ?i ?n ?c ?o ?r ?r ?e ?c ?t ?l ?y ?  ?d ?e ?l ?i ?v ?e ?r ?e ?d ?  ?t ?o ?  ?m ?e return ?( ?j ?o ?h ?n ?@ ?e ?n ?g ?) ?. return return ?J ?o ?h ?n ?  ?W ?e ?t ?h ?e ?r ?i ?l ?l return return return ?\C-u ?2 ?5 ?- ?  ?B ?e ?g ?i ?n ?  ?F ?o ?r ?w ?a ?r ?d ?e ?d ?  ?M ?e ?s ?s ?a ?g ?e ?  ?\C-u ?2 ?5 ?- backspace backspace backspace backspace backspace ?\C-a ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d ?\M-> ?\M-<])



(defalias 'send-testmail (read-kbd-macro
"C-x m john C-n C-e test M-> test SPC on SPC C-b NUL C-e C-b SPC NUL C-e C-u ESC | bin C-h C-h C-h d ate RET C-c C-c"))


(defalias 'remove-netscape-lock (read-kbd-macro
"C-x t rm SPC /home/john/.netscape/lo ck; SPC netscape SPC &"))



(fset 'Check-mail
   "\C-xbjohn\C-m\C-[xcheck-mail\C-m")

(defalias 'goto-vm-buffer
  (read-kbd-macro "C-x 1 C-x y M-> pn SPC"))

(defalias 'goto-gnus-buffer
  (read-kbd-macro "C-x 1 C-x b *Group* RET"))

(defalias 'goto-bufferlist
  (read-kbd-macro "C-x C-b C-x o C-x 1"))

(defalias 'goto-shell
  (read-kbd-macro "C-x t C-x 1"))

(defalias 'goto-mysql
  (read-kbd-macro "C-x b mysql RET"))

(defalias 'goto-mongo
  (read-kbd-macro "C-x b mongo RET"))

(defalias 'goto-webrick
  (read-kbd-macro "C-x b webrick RET"))


(fset 'goto-c1
   [?\C-x ?b ?c ?1 return])

(fset 'goto-c2
   [?\C-x ?b ?c ?2 return])

; (defalias 'goto-battleplan
;   (read-kbd-macro "C-x C-f /home/john/JT/TTD/Battl e TAB RET C-x 1"))

; (defalias 'goto-javasoftttd (read-kbd-macro
; "C-x C-f C-a C-k ~/JT/TTD/JAVASOFT_TTD RET"))

(defalias 'underline-line
  (read-kbd-macro "C-a C-e RET C-c C-x - C-a 2*C-p C-e C-n C-k C-n"))


(defalias 'jdbc-feedback-to-html (read-kbd-macro
"| C-a C-k /net/javabuzz/export/pu blic_html/srtech/Techno logy/JDBC/Feedback/bin/ mail2html RET n"))(setq load-home-init-file t) ; don't load init file from ~/.xemacs/init.el



; java macros


(fset 'java-new-applet
   [?/ ?/ return ?/ ?/ return ?/ ?/ return ?i ?m ?p ?o ?r ?t ?  ?j ?a ?v ?a ?. ?a ?p ?p ?l ?e ?t ?. ?A ?p ?p ?l ?e ?t ?; return return ?p ?u ?b ?l ?i ?c ?  ?c ?l ?a ?s ?s ?  ?  ?  ?e ?x ?t ?e ?n ?d ?s ?  ?A ?p ?p ?l ?e ?t ?  ?{ return return ?p ?u ?b ?l ?i ?c ?  ?v ?o ?i ?d ?  ?i ?n ?i ?t ?  ?( ?) ?  ?{ return ?} return ?p ?u ?b ?l ?i ?c ?  ?v ?o ?i ?d ?  ?s ?t ?a ?r ?t ?  ?( ?) ?  ?{ return ?} return ?p ?u ?b ?l ?i ?c ?  ?v ?o ?i ?d ?  ?s ?t ?o ?p ?  ?( ?) ?  ?{ return ?} return return ?p ?u ?b ?l ?i ?c ?  ?v ?o ?i ?d ?  ?p ?a ?i ?n ?t ?  ?( ?) ?  ?{ return ?} return ?} ?\M-< ?\C-s ?  ?  ?  ?\C-b ?\C-b])

(fset 'java-println
   [?\C-o tab ?S ?y ?s ?t ?e ?m ?. ?o ?u ?t ?. ?p ?r ?i ?n ?t ?l ?n ?( ?" ?" ?) ?; ?\C-b ?\C-b ?\C-b])

(defalias 'java-printerr
  (read-kbd-macro "TAB System.err.println(\"\"); 3*<C-b>"))

(defalias 'java-try-catch (read-kbd-macro
"TAB try SPC { RET TAB } RET TAB catch SPC (Exception SPC e) SPC { RET TAB System.out.println(\"exc eption: SPC \" SPC + SPC e.getMessage()); RET } 4*<C-p> C-e RET TAB"))

(defalias 'java-try (read-kbd-macro
"C-a C-o TAB try SPC { C-x C-x C-a C-o } ESC x indent- region RET"))

(defalias 'java-catch (read-kbd-macro
"C-a TAB catch SPC (Exception SPC e) S-SPC { RET TAB System.out.println(\"exc eption: S-SPC \" S-SPC + S-SPC e.getMessage()); RET }"))


; key defs for keyboard macros, C-cC-v prefix

;(global-set-key "\C-c\C-vc" 'commentout-region)
;(global-set-key "\C-c\C-vC" 'c-comment)
;(global-set-key "\C-c\C-vU" 'uncommentout-line)
; (global-set-key "\C-c\C-vp" 'cout-start)
; (global-set-key "\C-c\C-vP" 'cout-end)
;(global-set-key "\C-c\C-vI" 'inventor-include)
;(global-set-key "\C-c\C-ve" 'enscript-region)
;(global-set-key "\C-c\C-vp" 'pft-region)

; general key defs, C-cC-x prefix

(global-set-key "\C-c\C-x " 'set-mark-command)
(global-set-key "\C-c\C-xa" 'select-all)
(global-set-key "\C-c\C-xz\C-m" 'this-line-to-top-of-screen)
(global-set-key "\C-c\C-xz." 'this-line-to-center-of-screen)
(global-set-key "\C-c\C-xz-" 'this-line-to-bottom-of-screen)
(global-set-key "\C-c\C-xH" 'H)
(global-set-key "\C-c\C-xM" 'M)
(global-set-key "\C-c\C-xL" 'L)
(global-set-key "\C-c\C-x\C-l" 'clear-buffer)
(global-set-key "\C-c\C-xl" 'recenter)
(global-set-key "\C-c\C-x\C-n" 'scroll-up-one-line)
(global-set-key "\C-c\C-x\C-p" 'scroll-down-one-line)
(global-set-key "\C-c\C-x\C-d" 'kill-region)
(global-set-key "\C-c\C-x\C-o" 'toggle-read-only)
(global-set-key "\C-c\C-xD" 'delete-region)
(global-set-key "\C-c\C-x\C-k" 'kill-ring-save)
(global-set-key "\C-c\C-x\C-r" 'revert-buffer)
(global-set-key "\C-c\C-xG" 'global-unset-key)
(global-set-key "\C-c\C-xg" 'global-set-key)
(global-set-key "\C-c\C-xv" 'vc-toggle-read-only)
(global-set-key "\C-c\C-xC" 'check)
(global-set-key "\C-c\C-x\C-c" 'insert-ttd)
; (global-set-key "\C-c\C-xm" 'compile) ;; make, actually
(global-set-key "\C-c\C-xm" 'manual-entry) 
(global-set-key "\C-c\C-x\C-s" 'query-replace)
(global-set-key "\C-c\C-xS" 'query-replace-regexp)
(global-set-key "\C-c\C-x\C-b" 'rename-buffer)
(global-set-key "\C-c\C-xr" 'su)
(global-set-key "\C-c\C-xR" 'respond-forjohn)
; (global-set-key "\C-c\C-xa" ')
(global-set-key "\C-c\C-xc" 'check-mail)
; (global-set-key "\C-c\C-xh" 'show-hours)
(global-set-key "\C-c\C-xs" 'sum-hours)
(global-set-key "\C-c\C-xn" 'remove-netscape-lock)
(global-set-key "\C-c\C-xi" 'send-invisible)
(global-set-key "\C-c\C-xI" 'indent-region)
(global-set-key "\C-c\C-x\C-i" 'ispell-region)
; (global-set-key "\C-c\C-xf" 'fmt-region)
(global-set-key "\C-c\C-xf" 'fill-region)
(global-set-key "\C-c\C-xF" 'fill-paragraph)
(global-set-key "\C-c\C-xt" 'fttd)
(global-set-key "\C-c\C-x\C-t" 'send-testmail)
(global-set-key "\C-c\C-xT" 'shell-other-window)
(global-set-key "\C-c\C-xP" 'swap-windows)
(global-set-key "\C-c\C-xp" 'append-jp-db)
(global-set-key "\C-c\C-xo" 'gone)
(global-set-key "\C-c\C-xO" 'auto-save-mode)
(global-set-key "\C-c\C-xu" 'dirs)
(global-set-key "\C-c\C-xW" 'wc-region)
(global-set-key "\C-c\C-xb" 'load-my-abbrevs)
(global-set-key "\C-c\C-xB" 'load-html-abbrevs)
(global-set-key "\C-c\C-x-" 'horizontal-line)
(global-set-key "\C-c\C-x_" 'underline-line)
(global-set-key "\C-c\C-x'" 'quote-word)
(global-set-key "\C-c\C-x3" 'split-3)
(global-set-key "\C-c\C-x|" 'jdbc-feedback-to-html)
; (global-set-key "\C-c\C-xC- " 'delete-horizontal-space) 


; emacs-specific key bindings
(global-set-key "\C-c\C-xeb" 'eval-current-buffer)
(global-set-key "\C-c\C-xer" 'eval-region)
(global-set-key "\C-c\C-xen" 'name-last-kbd-macro)
(global-set-key "\C-c\C-xei" 'insert-kbd-macro)
(global-set-key "\C-c\C-xema" ''temp-macros)



; w3 key mappings (for now)
(global-set-key "\C-c\C-xwf" 'w3-fetch)
(global-set-key "\C-c\C-xwo" 'w3-open-local)

; vm key mappings
(global-set-key "\C-cr" 'rmail-search-backwards)

; html key mappings
(global-set-key "\C-c\C-xhw" 'web-object)
(global-set-key "\C-c\C-xhW" 'Web-object)
(global-set-key "\C-c\C-xha" 'applet)
(global-set-key "\C-c\C-xhb" 'html-bold)
(global-set-key "\C-c\C-xhB" 'html-unbold)
(global-set-key "\C-c\C-xhh" 'ht-head)
(global-set-key "\C-c\C-xhc" 'comment-html)
(global-set-key "\C-c\C-xhC" 'uncomment-html)
(global-set-key "\C-c\C-xhd" 'make-html-dd-list)
(global-set-key "\C-c\C-xhL" 'html-link)
(global-set-key "\C-c\C-xhu" 'html-ulplain)
(global-set-key "\C-c\C-xhU" 'html-endul)

(global-set-key "\C-c\C-xhl" 'html-list-entry)
(global-set-key "\C-c\C-xh1" 'html-h1)
(global-set-key "\C-c\C-xh2" 'html-h2)
(global-set-key "\C-c\C-xh3" 'html-h3)
(global-set-key "\C-c\C-xh4" 'html-h4)
(global-set-key "\C-c\C-xh5" 'html-h5)

; java key mappings
(global-set-key "\C-c\C-xja" 'java-new-applet)
(global-set-key "\C-c\C-xjp" 'java-println)
(global-set-key "\C-c\C-xjP" 'java-printerr)
(global-set-key "\C-c\C-xjt" 'java-try)
(global-set-key "\C-c\C-xjT" 'java-try-catch)
(global-set-key "\C-c\C-xjc" 'java-catch)
(global-set-key "\C-c\C-xjf" 'font-lock-mode)

; special key defs
(global-set-key [(shift tab)] 'other-window)
; (global-set-key [C-tab] 'tab-to-tab-stop)
(global-set-key [f2] 'goto-shell)
(global-set-key [f3] 'goto-bufferlist)
(global-set-key [f4] 'goto-vm-buffer)
(global-set-key "\C-c\C-x4" 'goto-vm-buffer)
(global-set-key [f5] 'goto-gnus-buffer)
(global-set-key [f7] 'goto-javasoftttd)
(global-set-key [f8] 'goto-battleplan)
(global-set-key [f12] 'call-last-kbd-macro)
'(global-set-key [S-f34] 'scroll-down-one-line)
'(global-set-key [S-f28] 'scroll-up-one-line)
;(global-set-key [home] 'this-line-to-top-of-screen)
(global-set-key [f27] 'this-line-to-top-of-screen)
(global-set-key [f33] 'this-line-to-bottom-of-screen)
;(global-set-key [C-down] 'shrink-window-n-lines)
;(global-set-key [C-up] 'grow-window-n-lines)
(global-set-key [up] 'previous-line)
(global-set-key [down] 'next-line)
;(global-set-key [C-return] 'dirs)
;(global-set-key [M-f1] 'goto-c1)
;(global-set-key [M-f2] 'goto-c2)
;(global-set-key [M-f3] 'goto-shell)


; meta key equivs
(global-set-key "\C-\M-n" 'seven-down)
(global-set-key "\M-n" 'seven-down)
(global-set-key "\C-\M-p" 'seven-up)
(global-set-key "\M-p" 'seven-up)
(global-set-key "\C-\M-h" 'H)
(global-set-key "\C-\M-m" 'M)
(global-set-key "\C-\M-l" 'L)
;(global-set-key '(meta return) 'this-line-to-top-of-screen)
;;(global-set-key '(control meta return) 'this-line-to-top-of-screen)
;(global-set-key '(control meta 46) 'this-line-to-center-of-screen)
;(global-set-key '(control meta 95) 'this-line-to-bottom-of-screen)
;(global-set-key '(meta o) 'switch-to-other-buffer)
(global-set-key "\M-o" 'switch-to-other-buffer)
; this is a bad idea
;(global-set-key '(control meta k) 'kill-this-buffer)

(global-set-key "\C-xre" 'rename-buffer)

(define-key esc-map "g" 'goto-line)
(define-key ctl-x-map "=" 'what-line)
(define-key ctl-x-map "" 'vm)
(define-key ctl-x-map "" 'arc-log)


(define-key ctl-x-map "t" 'shell)
(define-key ctl-x-map "T" 'goto-TTD)
(define-key ctl-x-map "D" 'goto-delicious)
(define-key ctl-x-map "c" 'compare-windows)
(define-key ctl-x-map "s" 'goto-skyler)
(define-key ctl-x-map "y" 'goto-vm)
(define-key ctl-x-map "m" 'goto-mysql)
(define-key ctl-x-map "M" 'goto-mongo)
(define-key ctl-x-map "l" 'goto-tail)
(define-key ctl-x-map "w" 'goto-webrick)


; c-x r commands
(define-key ctl-x-map "rf" 'fundamental-mode)


(setq tab-width '4)


(setq next-line-add-newlines nil)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

; (load-file (expand-file-name "~/emacs/local/tasks.el"))
; (load-file (expand-file-name "~/emacs/local/hours.el"))
; (load-file (expand-file-name "~/emacs/local/misc.el"))
; (load-file (expand-file-name "~/emacs/local/dvo.el"))
;(load-file (expand-file-name "/opt/gnu/share/emacs/19.30/lisp/misc.el"))


(setq exec-path (cons "/opt/gnu/bin" exec-path))
; (setq vc-path (cons "/opt/gnu/bin" vc-path))

; (setq inhibit-startup-echo-area-message "YOUR-USER-NAME")


;; c-mode stuff

(defconst my-c-style
  '("PERSONAL"
    (c-basic-offset . 4)
    (c-comment-only-line-offset . 0)
    (c-offsets-alist . ((statement-block-intro . +)
			(statement-case-intro . +)
			(statement-case-open . 0)
			(knr-argdecl-intro . +)
			(substatement-open . 0)
			(case-label . +)
			(statement-cont . +)
			(access-label . -)
			(inclass . +)
			))
    )
)

(defun my-c-mode-common-hook ()
  ;; set up for my perferred indentation style, but  only do it once
  (let ((my-style "PERSONAL"))
    (or (assoc my-style c-style-alist)
	(setq c-style-alist (cons my-c-style c-style-alist)))
    (c-set-style my-style))
  ;; keybindings for both C and C++.  We can put these in c-mode-map
  ;; because c++-mode-map inherits it
  (define-key c-mode-map "\C-m" 'newline-and-indent)
  (c-set-offset 'inclass '+)
  )
;(c-toggle-auto-hungry-state 1)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

; (require 'crypt++)
; (setq inhibit-startup-message t)

; get tabbing, textfill, etc working properly...
; ( setq tab-stop-list '(4 8 12 ... 80 ))  DO THIS
(setq tab-stop-list '(3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60))
; (setq tab-width '4) ; why isn't this working from above?

(setq zmacs-regions nil)
(setq vm-reply-subject-prefix "Re: ")
; (setq mail-default-reply-to "john.wetherill@eng.sun.com")
; (setq vm-mail-header-from "john.wetherill@eng.sun.com")

(setq gnus-select-method '(nntp "engnews1.eng.sun.com"))


(setq url-proxy-services '(("http"     . "webcache-cup.eng.sun.com:8080")
			   ("no_proxy" . "^.*\\(eng.sun\\|seanet\\)\.com")))
(custom-set-variables
 '(load-home-init-file t t)
; '(user-mail-address "john@los-gatos.net")
 '(query-user-mail-address nil))

(custom-set-faces)



(setq vm-mode-hooks
      (function (lambda ()
		  (setq vm-url-browser 'vm-mouse-send-url-to-netscape)
		  (define-key vm-mode-map "\M-\C-p"
		    'seven-up)
		  (define-key vm-mode-map "\M-\C-n"
		    'seven-down)
		  )))

; Don't use multiple frames
(setq vm-frame-per-composition nil)
(setq vm-frame-per-folder nil)
(setq vm-frame-per-edit nil)
(setq vm-frame-per-summary nil)


;   For vm use the following:
;(require 'messagexmas)
;(require 'smiley)
;(add-hook 'vm-select-message-hook '(lambda () (smiley-region (point-min)
;							     (point-max))))

;(setq vm-spool-files (list
;                      (concat "/home/john/" "INBOX")
;                      (concat "imap:localhost:1143:inbox:login:"
;                              (getenv "USER") ":*")
;                      (concat "INBOX" "CRASH")
;))


;(setq vm-spool-files (list
;                      (concat "/home/john/" "INBOX")
;                      (concat "imap:ha1cup-mail.eng:143:inbox:login:"
;                              (getenv "USER") ":*")
;                      (concat "INBOX" "CRASH")
;))


;; Options Menu Settings
;; =====================
;(cond
; ((and (string-match "XEmacs" emacs-version)
;       (boundp 'emacs-major-version)
;       (or (and
;            (= emacs-major-version 19)
;            (>= emacs-minor-version 14))
;           (= emacs-major-version 20))
;       (fboundp 'load-options-file))
;  (load-options-file "/home/john/.xemacs-options")))
;;; ============================
;;; End of Options Menu Settings


(setq shell-mode-hook
      (function (lambda ()
		  (define-key shell-mode-map "\C-l"
		    'clear-buffer-to-this-line)
		  )))
; prompt to create mail folders
(setq vm-confirm-new-folders t)

; turn off menu bar
;(set-specifier menubar-visible-p nil)

; turn off tool bars
;(set-specifier top-toolbar-visible-p nil)
; maybe this one should be a vm-hook:
;(set-specifier left-toolbar-visible-p nil) 


;;;------------------------------------------
; FROM HERE TO END OF FILE, WINDOWS SPECIFIC

;;; --------------------------------------------------
;;;; Set up the shell for the shell mode (tcsh)
(defun my-shell-mode-hook ()
(interactive)
(setq shell-completion-fignore '("~" "#" "%" ".class"))
(setq comint-completion-addsuffix '("/" . " "))
(setq completion-ignored-extensions '(".o" ".elc" "~" ".bin" ".bak"
".obj" ".map" ".dvi" ".toc" ".log" ".aux" ".a" ".ln" ".lof" ".blg"
".bbl" ".glo" ".idx" ".lot" ".fmt" ".class"))
)
;(setq shell-mode-hook nil)
(add-hook 'shell-mode-hook 'my-shell-mode-hook)

;(add-hook shell-mode-hook '(function (lambda ()
;		  (define-key shell-mode-map "\C-l"
;		    'clear-buffer-to-this-line)
;		  )))

(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)
;;;; --------------------------------------------------
; figure out how to turn this off - the following simply toggles
;(menu-bar-mode nil)
;(scroll-bar-mode nil)

(defun select-all(L) 
  "Select all text in buffer."
  (interactive "P")
  (copy-region-as-kill (point-min) (point-max))
)

; ------------------------------------------
; THIS SECTION FOR LINUX
; ------------------------------------------
   (autoload 'vm "vm" "Start VM on your primary inbox." t)
   (autoload 'vm-other-frame "vm" "Like `vm' but starts in another frame." t)
   (autoload 'vm-visit-folder "vm" "Start VM on an arbitrary folder." t)
   (autoload 'vm-visit-virtual-folder "vm" "Visit a VM virtual folder." t)
   (autoload 'vm-mode "vm" "Run VM major mode on a buffer" t)
   (autoload 'vm-mail "vm" "Send a mail message using VM." t)
   (autoload 'vm-submit-bug-report "vm" "Send a bug report about VM." t)

(fset 'switch-to-other-buffer
   "\C-xb\C-m")

;(global-set-key [C-M-return] 'this-line-to-top-of-screen)


(fset 'netscape-go
   [?\C-x ?\C-f ?/ ?t ?m ?p ?/ ?n ?e ?w backspace ?t ?s ?c ?a ?p ?e ?. backspace ?- ?g ?o ?- backspace ?. ?h ?t ?m ?l return ?\M-> ?\C-y ?\M-< ?\C-_ ?\M-< ?\C-w ?\C-y ?\M-y ?\M-< ?\C-o ?< ?h ?t ?m ?l ?> return ?< ?b ?o ?d ?y ?> return ?< ?a ?  ?h ?r ?e ?f ?- backspace ?= ?" ?\C-d ?\C-e ?\M-> ?" ?> ?\C-y ?< ?/ ?a ?> return ?< ?/ ?b ?o ?d ?y ?> return ?< ?/ ?h ?t ?m ?l ?> ?\C-x ?\C-s])

(global-set-key "\C-c\C-xn" 'netscape-go)

; java mode hook 
;(require 'autoinsert) 
;(add-hook 'find-file-hooks 'auto-insert) ;; enable auto-insert 
;(setq auto-insert-query nil)             ;; don't ask me -- just do it. 
;(require 'tempo) 
(defvar java-new-buffer-template-string 
  '("/**\n" 
    " * @(#)" 
         (file-name-nondirectory buffer-file-name) 
    " *\n" 
    " *\n" 
    " * @author " (user-full-name) "\n" 
    " * @version %W %E\n" 
    " */\n" 
    " \n" 
    " \n" 
    "public class " 
         (file-name-sans-extension (file-name-nondirectory buffer-file-name)) 
         " {\n" 
    "    public " 
         (file-name-sans-extension (file-name-nondirectory buffer-file-name)) 
    "() {\n" 
    "        \n" 
    "    }\n" 
         "\n" 
    "    public static void main(String[] args) {\n" 
    "        " 
    (file-name-sans-extension (file-name-nondirectory buffer-file-name)) 
    " my" 
    (file-name-sans-extension (file-name-nondirectory buffer-file-name)) 
    " = new " 
    (file-name-sans-extension (file-name-nondirectory buffer-file-name)) 
    "();\n" 
    "    }\n" 
    "}\n") 
  "*Template for new Java mode buffers.") 
 
;(tempo-define-template "java-new-buffer-template" 
;                       java-new-buffer-template-string 
;                       nil 
;                       "Insert skeleton for a new Java buffer") 
 
;(defun java-new-buffer-template-and-relocate () 
;  ;; insert the template and move to the location where the user will 
;  ;; want to start typing. 
;  (tempo-template-java-new-buffer-template) 
;  (beginning-of-buffer) 
;  (search-forward "        ")) 
 
;(push ("\\.java$" . java-new-buffer-template-and-relocate) auto-insert-alist) 
 
;(setq auto-insert-alist (cons '("\\.java$" . java-new-buffer-template-and-relocate) auto-insert-alist))


(setq load-path (cons (expand-file-name "~/local/emacs/public") load-path))
(setq load-path (cons (expand-file-name "~/local/emacs/public/vm") load-path))
(autoload 'vm "vm" "VM Mail." t)

(menu-bar-mode 0)
;(transient-mark-mode 0)

(setq load-path (cons (expand-file-name "/usr/share/xemacs/xemacs-packages/lisp/cc-mode") load-path))

(autoload 'opa-js-mode "/usr/share/opa/emacs/opa-js-mode.el" "OPA JS editing mode." t)
(autoload 'opa-classic-mode "/usr/share/opa/emacs/opa-mode.el" "OPA CLASSIC editing mode." t)
(add-to-list 'auto-mode-alist '("\\.opa$" . opa-js-mode)) ;; <-- Set the default mode here
(add-to-list 'auto-mode-alist '("\\.js\\.opa$" . opa-js-mode))
(add-to-list 'auto-mode-alist '("\\.classic\\.opa$" . opa-classic-mode))

; (add-to-list 'load-path "/usr/share/xemacs/coffee-mode")
; (require 'coffee-mode)

; (add-to-list 'load-path "/usr/share/xemacs/color-theme.el")
; (add-to-list 'load-path "/usr/share/xemacs/themes")
; (add-to-list 'load-path "/usr/share/xemacs")
; (require 'color-theme)
; (eval-after-load "color-theme"
;   '(progn
;      (color-theme-initialize)
;      (color-theme-hober)))

