;;; hemisu-theme.el --- Hemisu for Emacs.

;; based on Hemisu vim theme
;; of Noah Frederick

;; Copyright (C) 2013 Andrzej Sliwa

;; Author: Andrzej Sliwa
;; URL: http://github/anrzejsliwa/django-theme
;; Version: 1.0.0
;;
;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A port of Hemisu theme to Emacs. (https://github.com/noahfrederick/Hemisu)
;;
;;; Installation:
;;
;;   M-x package-install -> hemisu-theme
;;
;;
;;   (load-theme 'hemisu-dark t)
;;
;;     or
;;
;;   (load-theme 'hemisu-light t)
;;
;; Don't forget that the theme requires Emacs 24.
;;
;;; Bugs
;;
;; None that I'm aware of.
;;
;;; Credits
;;
;; Noah Frederick created the original theme for vim on such this port
;; is based.
;;
;;; Code:

(require 'cl-lib)

(defun create-hemisu-theme (variant theme-name &optional childtheme)
          ;; name                                     gui       term
  (let* ((black              (if (display-graphic-p) "#000000" nil))
         (white              (if (display-graphic-p) "#FFFFFF" "#ffffff"))
         (almost-white       (if (display-graphic-p) "#EEEEEE" "#eeeeee"))
         (almost-black       (if (display-graphic-p) "#111111" "#121212"))
         (middle-dark-grey   (if (display-graphic-p) "#777777" "#606060"))
         (middle-light-grey  (if (display-graphic-p) "#999999" "#949494"))
         (light-grey         (if (display-graphic-p) "#BBBBBB" "#b2b2b2"))
         (dark-grey          (if (display-graphic-p) "#444444" "#444444"))

         (dark-pink          (if (display-graphic-p) "#D65E76" "#870000"))
         (middle-dark-pink   (if (display-graphic-p) "#FF0055" "#ff005f"))
         (middle-light-pink  (if (display-graphic-p) "#D65E76" "#d75f5f"))
         (light-pink         (if (display-graphic-p) "#FFAFAF" "#ffafaf"))

         (dark-blue          (if (display-graphic-p) "#005F87" "#005f87"))
         (middle-dark-blue   (if (display-graphic-p) "#538192" "#005f87"))
         (middle-light-blue  (if (display-graphic-p) "#9FD3E6" "#87d7d7"))
         (light-blue         (if (display-graphic-p) "#CBE4EE" "#d7ffff"))

         (dark-green         (if (display-graphic-p) "#5F5F00" "#5f5f00"))
         (middle-dark-green  (if (display-graphic-p) "#739200" "#5f8700"))
         (middle-light-green (if (display-graphic-p) "#B1D631" "#afd75f"))
         (light-green        (if (display-graphic-p) "#BBFFAA" "#afffaf"))

         (dark-tan           (if (display-graphic-p) "#503D15" "#5f0000"))
         (light-tan          (if (display-graphic-p) "#ECE1C8" "#ffffd7"))

         (bg          (if (eq variant 'light) white             "#000000"))
         (norm        (if (eq variant 'light) almost-black      almost-white))
         (comment     (if (eq variant 'light) middle-light-grey middle-dark-grey))
         (dimmed      (if (eq variant 'light) middle-dark-grey  middle-light-grey))
         (subtle      (if (eq variant 'light) light-grey        dark-grey))
         (faint       (if (eq variant 'light) almost-white      almost-black))
         (accent1     (if (eq variant 'light) middle-dark-blue  middle-light-blue))
         (accent2     (if (eq variant 'light) middle-dark-green middle-light-green))
         (accent3     (if (eq variant 'light) middle-dark-pink  light-green))
         (accent4     (if (eq variant 'light) dark-tan          light-tan))
         (norm-red    (if (eq variant 'light) middle-dark-pink  middle-light-pink))
         (norm-green  (if (eq variant 'light) middle-dark-green middle-light-green))
         (norm-blue   (if (eq variant 'light) middle-dark-blue  middle-light-blue))
         (faint-red   (if (eq variant 'light) light-pink         dark-pink))
         (faint-green (if (eq variant 'light) light-green       dark-green))
         (faint-blue  (if (eq variant 'light) light-blue        dark-blue)))

    (custom-theme-set-faces
     theme-name

     ;; basic colors
     `(cursor    ((t (:background ,accent3 :foreground ,bg))))
     `(default   ((t (if (display-graphic-p) (:background ,bg :foreground ,norm)
                       (:background ,bg :foreground ,norm)))))

     ;; Highlighting faces
     `(fringe    ((t (:background ,faint))))
     `(highlight ((t (:background ,subtle))))
     `(region    ((t (:background ,faint-blue))))

     ;; Font lock faces
     `(font-lock-string-face        ((t (:foreground ,accent2))))
     `(font-lock-comment-face       ((t (:foreground ,comment :slant italic))))
     `(font-lock-constant-face      ((t (:foreground ,accent1))))
     `(font-lock-function-face      ((t (:foreground ,norm    :weight bold))))
     `(font-lock-function-name-face ((t (:foreground ,norm))))
     `(font-lock-variable-name-face ((t (:foreground ,accent2))))
     `(font-lock-builtin-face       ((t (:foreground ,accent3))))
     `(font-lock-keyword-face       ((t (:foreground ,accent2 :weight bold))))
     `(font-lock-type-face          ((t (:foreground ,accent3))))

     ;; parens
     `(show-paren-match-face    ((t (:background unspecified :underline (:style line
                                                                                :color ,accent1)))))
     `(show-paren-mismatch-face ((t (:background unspecified :foreground ,norm-red
                                                 :underline (:style line :color ,subtle)))))

     ;; smartparens
     `(sp-show-pair-match-face     ((t (:weight bold :underline t))))
     `(sp-show-pair-mismatch-face  ((t (:foreground ,norm-red))))

     ;; line numbers, current line, mode-line
     `(hl-line  ((t (:background ,faint))))
     `(linum    ((t (:background ,subtle)))))

    ;; set variables
    (custom-theme-set-variables
     theme-name
     `(fce-rule-color ,subtle))

    ;; call chained theme function
    (when childtheme (funcall childtheme))))

  ;; Local Variables:
  ;; no-byte-compile: t
  ;; End:
(provide 'hemisu-theme)
;;; hemisu-theme.el ends here
