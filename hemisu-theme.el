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

(defvar hemisu-color-defs
  ;; name                hex       256
  '((black              "#000000" "#000000")
    (white              "#FFFFFF" "#ffffff")
    (almost-white       "#EEEEEE" "#eeeeee")
    (almost-black       "#111111" "#121212")
    (middle-dark-grey   "#777777" "#606060")
    (middle-light-grey  "#999999" "#949494")
    (light-grey         "#BBBBBB" "#b2b2b2")
    (dark-grey          "#444444" "#444444")

    (red                "#D65E76" "#870000")
    (middle-dark-pink   "#FF0055" "#ff005f")
    (middle-light-pink  "#D65E76" "#d75f5f")
    (light-pink         "#FFAFAF" "#ffafaf")

    (dark-blue          "#005F87" "#005f87")
    (middle-dark-blue   "#538192" "#005f87")
    (middle-light-blue  "#9FD3E6" "#87d7d7")
    (light-blue         "#CBE4EE" "#d7ffff")

    (dark-green         "#5F5F00" "#5f5f00")
    (middle-dark-green  "#739200" "#5f8700")
    (middle-light-green "#B1D631" "#afd75f")
    (light-green        "#BBFFAA" "#afffaf")

    (dark-tan           "#503D15" "#5f0000")
    (light-tan          "#ECE1C8" "#ffffd7"))
  "Idea shamelessly stolen from the official solarized theme.
  Each column is a different set, one of which will be stolen
  based on term capabilities.")



;; Local Variables:
;; no-byte-compile: t
;; End:
(provide 'hemisu-theme)
;;; hemisu-theme.el ends here
