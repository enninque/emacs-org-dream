;;; org-dream.el --- 
;;
;; Author:  <raisatu@sabayon.local>
;; Version: 0.1
;; URL: 
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;; Simple plugin for writing dreams, using Emacs. It's using org-mode.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'org)
(require 'subr-x)

(defgroup org-dream nil
  "Org dream group."
  :prefix "org-dream-"
  :group 'org)

(defconst org-dream--file-initial-header
  '("* Dreams"
    "")
  "Default content of newly created files.")

(defconst org-dream--dream-initial-content 
  '("** Dream"
    ""
    "*** Name"
    ""
    "*** Places"
    ""
    "*** Emotions"
    ""
    "*** People"
    ""
    "*** Content"
    "")
  "Default content of newly created dreams.")

(defcustom org-dream-file-format "~/org/dreams/%Y-%m/%Y-%m-%d.org"
  "Format of dream files. Takes same args with `format-time-string'."
  :type 'string
  :group 'org-dream)

(defcustom org-dream-file-header org-dream--file-initial-header
  "Format of dream files. Takes same args with `format-time-string'."
  :type '(repeat string)
  :group 'org-dream)

(defcustom org-dream-content org-dream--dream-initial-content 
  "Format of dream files. Takes same args with `format-time-string'."
  :type '(repeat string)
  :group 'org-dream)

(defun org-dream-edit ()
  "Edit dream file.
If not created, create with default content, which is sum of
- `org-dream-file-header'
- `org-dream-content'"
  (interactive)
  
  (let ((dream-file-path (format-time-string org-dream-file-format)))
    (if (file-exists-p dream-file-path)
        (find-file dream-file-path)
      (find-file dream-file-path)
      (insert (string-join org-dream-file-header
                           "\n"))
      (org-dream-insert-dream)
      (goto-char (point-max))
      (save-buffer))))

(defun org-dream-insert-dream ()
  "Insert a dream."
  (interactive)
  
  (insert (string-join org-dream-content
                       "\n")))

(provide 'org-dream)
;;; org-dream.el ends here
