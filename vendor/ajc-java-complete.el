;; Copyright (C) 2010  joseph <jixiuf@gmail.com> Limited
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;; Firstly I am not an English Speaker ,so forgive my bad English .

;; Commentary:
;; the prefix ajc means auto java complete ,or another java  complete.

;; this is a tag based  complete for java.
;; before you use this tool ,you should have installed  auto-complete ,
;; with the support of auto-complete you can use ajc-java-complete  to
;; complete  class,methods,constructors and import class 
;; also it can auto import class under point or try to import all class in buffer

;; this is the suggested two bindings :
;;   (global-set-key (kbd "C-c i") (quote ajc-import-all-unimported-class))
;;   (global-set-key (kbd "C-c m") (quote ajc-import-class-under-point))

;; actually the default config is in ajc-java-complete.el file ,just load it ,or write 
;; your own config file if you don't want to  use auto-complete.
(defcustom ajc-use-short-class-name t
  "if it is not nil then ,when complete method and constructor ,params and exceptions will use short class name ,
instead of full class name"
  :type 'boolean
  :group 'ajc-java-complete)

(defcustom ajc-tag-file "~/.java_base.tag"
  "the tag file is  used for java complete ,it  is generate by a Tags.java ,
so before you use this tool ,try to compile Tags.java
          javac Tags.java
and  use this class like this 
         java  Tags  
 it will tag all jars in classpath to tag file , or
         java Tags   com.whatever.* 
 just tag class under com.whatever packages "
  :type 'string
  :group 'ajc-java-complete)

( defun ajc-read-line ( line-number  &optional buffer  )
  "read a line  and return the string"
  (if buffer (with-current-buffer
          buffer ( goto-line line-number)
          (buffer-substring-no-properties (line-beginning-position) (line-end-position)) )
     (progn ( goto-line line-number)
       (buffer-substring-no-properties (line-beginning-position) (line-end-position)) ) ) )

(defun ajc-split-string-with-separator(str regexp &optional replacement OMIT-NULLS)
  "this function is a tool like split-string, but it treat separator as an element of returned list
for example (ajc-split-string-with-separator  abc.def.g \\. .   ) will return '(abc . def . g ) "
  (if (and str  ( > (length str ) 0))
      (let ( (split-list)  (substr) (match-end ))
        (if  (string-match regexp str)
            (progn (while (string-match regexp  str  )
                     (setq match-end (match-end 0) )
                     (setq  substr (substring-no-properties str 0 (- match-end 1)))
                     (if OMIT-NULLS 
                         (if (> (length substr ) 0) (setq split-list (append split-list (list  substr)  )) )
                       (setq split-list (append split-list (list  substr)  )) )
                     (if replacement 
                         (setq split-list (append split-list (list replacement)))
                       (setq split-list (append split-list (list regexp))) )
                     (setq str (substring-no-properties str  match-end)) )
                     (if OMIT-NULLS 
                         (if (> (length str ) 0) (setq split-list (append split-list (list str)  )) )
                       (setq split-list (append split-list (list  str)  )) )
                   (setq split-list split-list) )
          (setq split-list (list str))
 ) ) ) )

(defun ajc-split-pkg-item ( pkg-line-string )
 "the format pkg-line-string is  str`num`num
  this function translate it to a list ,the num will be string2number
  give me  `java.lang`222`333 ,return '(\"java.lang\" 222 333 ) "
  (let (( pkg-item (split-string pkg-line-string "`" t)) ) 
    (setcar (nthcdr 1 pkg-item ) (string-to-number (nth 1 pkg-item ))  )
    (setcar (nthcdr 2 pkg-item ) (string-to-number (nth 2 pkg-item ))  )
    (setq pkg-item pkg-item ) ) )

(defun ajc-split-pkg-item-by-pkg-ln ( pkg-line-number  &optional buffer )
  "the format pkg-line-string is str`num`num   this function translate it to a list ,the num will be string2number
   return a list of pkg info of line-number "
  (ajc-split-pkg-item (ajc-read-line pkg-line-number  (or buffer (ajc-reload-tag-buffer-maybe))  )  ) )

(defun ajc-split-class-item ( class-line-string )
 "the format of class-line-string is classname`packageLineNum`memberStartLineNum`memberEndLineNum
  this function translate it to a list ,the num will be convert to number "
  (let (( class-item (split-string class-line-string "`" t)) ) 
    (setcar (nthcdr 1 class-item ) (string-to-number (nth 1 class-item ))  )
    (setcar (nthcdr 2 class-item) (string-to-number (nth 2 class-item ))  )
    (setcar (nthcdr 3 class-item) (string-to-number (nth 3 class-item ))  )
    (setq class-item class-item ) ) )

(defun ajc-ajc-split-class-item-by-class-ln ( class-line-number  &optional buffer )
  (ajc-split-class-item  (ajc-read-line class-line-number  (or buffer (ajc-reload-tag-buffer-maybe))  )) )

(defun ajc-split-constructor-by-line-num ( constructor-line-num )
   (ajc-split-constructor  (ajc-read-line constructor-line-num  (or buffer (ajc-reload-tag-buffer-maybe))  )) )

(defun ajc-split-field (field-line-string)
  (let ((field-item) (split-list) (return-type))
    (setq field-line-string (substring-no-properties field-line-string 1))
    (setq split-list (split-string  field-line-string "`"))
    ;;handle field name
    (add-to-list  'field-item  (car split-list) t)
    (setq return-type (nth 1 split-list))
    (if (string-match  "^~" return-type )
        (add-to-list 'field-item (substring-no-properties  return-type 1) t)
      (progn (string-match ".*:\\(.*\\)"  return-type )  
             (add-to-list 'field-item  (ajc-ajc-split-class-item-by-class-ln 
                      (string-to-number (match-string-no-properties 1 return-type )) ) t) ) ) 
  (setq field-item field-item) ) )

(defun ajc-field-to-string (field-item)
  (let ((return-line))
    (setq  return-line  (car field-item)) ) )

(defun ajc-method-to-string (method-item)
  (let ((method-string  (car method-item) )
       (params (nth 2 method-item)   )
       (exceptions (nth 3 method-item)) )
    (if (stringp params ) (setq method-string (concat method-string "()")) 
      (progn 
        (setq method-string (concat method-string "("))                
        (dolist (param  params )
          (when (stringp param ) (setq method-string (concat method-string param " , " ) ) )
          (when (listp param) 
            (if ajc-use-short-class-name 
                (setq method-string (concat method-string  (car param)  " , " ) ) 
              (setq method-string (concat method-string
                                               (car (ajc-split-pkg-item-by-pkg-ln (nth 1 param) ))  "."  
                                               (car param)  " , " ) ) ) ) )
        (setq method-string  (replace-regexp-in-string  " , $" ")" method-string ) ) ) )
    (when (listp exceptions )  
      (setq method-string (concat method-string " throws "))                
      (dolist (exception  exceptions )
        (when (stringp exception ) (setq method-string (concat method-string exception " , " ) ) )
        (when (listp exception) 
          (if ajc-use-short-class-name 
              (setq method-string (concat method-string  (car exception)  " , " ) ) 
            (setq method-string (concat method-string
                                             (car (ajc-split-pkg-item-by-pkg-ln (nth 1 exception) ))  "."  
                                             (car exception)  " , " ) ) ) ) )
      (setq method-string  (replace-regexp-in-string  ", $" "" method-string ) ) ) 
    (setq method-string method-string) ) )


(defun ajc-split-method ( method-line-string )
  (let ((method-item) (split-list)(return-type) )
    (setq split-list (split-string  method-line-string "`"))
    ;;handle method name
    (add-to-list  'method-item  (car split-list) t)
    (setq return-type (nth 1 split-list))
    (if (string-match  "^~" return-type )
        (add-to-list 'method-item (substring-no-properties  return-type 1) t)
      (progn (string-match ".*:\\(.*\\)"  return-type )  
             (add-to-list 'method-item  (ajc-ajc-split-class-item-by-class-ln 
                      (string-to-number (match-string-no-properties 1 return-type )) ) t) ) )
    ;;handle params if exists
    (if (not  (string-equal "" (nth 2 split-list)) )
        (let ((params)(param-split-list)) 
          (setq param-split-list (split-string (nth 2 split-list)  "," t))
          (dolist (param param-split-list)
            (if (string-match  "^~" param )
                (setq params  (append  params  (list (substring-no-properties param 1 ) )  ))
              (progn 
                (string-match ".*:\\(.*\\)"  param  )  
                (setq params (append params (list (ajc-ajc-split-class-item-by-class-ln 
                                                   (string-to-number (match-string-no-properties 1 param)))))) ) ) ) 
          (setq method-item (append method-item (list params))) ) 
      (setq method-item (append method-item  (list "")) ) )
    (if (not  (string-equal "" (nth 3 split-list)) )
        (let ((exceptions)(exception-split-list)) 
          (setq exception-split-list (split-string (nth 3 split-list)  "," t))
          (dolist (exception exception-split-list)
            (if (string-match  "^~" exception )
                (setq exceptions  (append  exceptions  (list (substring-no-properties exception 1 ) )  ))
              (progn 
                (string-match ".*:\\(.*\\)"  exception  )  
                (setq exceptions (append exceptions (list (ajc-ajc-split-class-item-by-class-ln 
                                      (string-to-number (match-string-no-properties 1 exception))))))))) 
          (setq method-item (append method-item (list exceptions))) ) 
      (setq method-item (append method-item  (list "")) ) )   
      (setq method-item method-item) ) )

(defun ajc-split-constructor ( constructor-line-string )
  (let ((constructor-item) (split-list) )
    (setq constructor-line-string (substring-no-properties constructor-line-string 2))
    (setq split-list (split-string  constructor-line-string "`"))
    ;;handle constructor name
    (add-to-list  'constructor-item  (car split-list) t)
    ;;handle params if exists
    (if (not  (string-equal "" (nth 1 split-list)) )
        (let ((params)(param-split-list)) 
          (setq param-split-list (split-string (nth 1 split-list)  "," t))
          (dolist (param param-split-list)
            (if (string-match  "^~" param )
                (setq params  (append  params  (list (substring-no-properties param 1 ) )  ))
              (progn 
                (string-match ".*:\\(.*\\)"  param  )  
                (setq params (append params (list (ajc-ajc-split-class-item-by-class-ln 
                                                   (string-to-number (match-string-no-properties 1 param)))))) ) ) ) 
          (setq constructor-item (append constructor-item (list params))) ) 
      (setq constructor-item (append constructor-item  (list "")) ) )
    (if (not  (string-equal "" (nth 2 split-list)) )
        (let ((exceptions)(exception-split-list)) 
          (setq exception-split-list (split-string (nth 2 split-list)  "," t))
          (dolist (exception exception-split-list)
            (if (string-match  "^~" exception )
                (setq exceptions  (append  exceptions  (list (substring-no-properties exception 1 ) )  ))
              (progn 
                (string-match ".*:\\(.*\\)"  exception  )  
                (setq exceptions (append exceptions (list (ajc-ajc-split-class-item-by-class-ln 
                                               (string-to-number (match-string-no-properties 1 exception))))))))) 
          (setq constructor-item (append constructor-item (list exceptions))) ) 
      (setq constructor-item (append constructor-item  (list "")) )
      )    (setq constructor-item constructor-item) ) )

(defun ajc-constructor-to-string (constructor-item)
  (let((constructor-string  (car constructor-item) )
       (params (nth 1 constructor-item)   )
       (exceptions (nth 2 constructor-item)) )
    (if (stringp params ) (setq constructor-string (concat constructor-string "()")) 
      (progn 
        (setq constructor-string (concat constructor-string "("))                
        (dolist (param  params )
          (when (stringp param ) (setq constructor-string (concat constructor-string param " , " ) ) )
          (when (listp param) 
            (if ajc-use-short-class-name 
                (setq constructor-string (concat constructor-string  (car param)  " , " ) ) 
              (setq constructor-string (concat constructor-string
                                               (car (ajc-split-pkg-item-by-pkg-ln (nth 1 param) ))  "."  
                                               (car param)  " , " ) ) ) ) )
        (setq constructor-string  (replace-regexp-in-string  " , $" ")" constructor-string ) ) ) )
    (when (listp exceptions )  
      (setq constructor-string (concat constructor-string " throws "))                
      (dolist (exception  exceptions )
        (when (stringp exception ) (setq constructor-string (concat constructor-string exception " , " ) ) )
        (when (listp exception) 
          (if ajc-use-short-class-name 
              (setq constructor-string (concat constructor-string  (car exception)  " , " ) ) 
            (setq constructor-string (concat constructor-string
                                             (car (ajc-split-pkg-item-by-pkg-ln (nth 1 exception) ))  "."  
                                             (car exception)  " , " ) ) ) ) )
      (setq constructor-string  (replace-regexp-in-string  ", $" "" constructor-string ) ) ) 
    (setq constructor-string constructor-string) ) )

(defvar ajc-tag-buffer nil "this is the buffer of .java_base.tag" )
;; find tag file 
( defun ajc-init ( ) "find java tag file and do some initial works, like  populate some variables "
  (setq ajc-tag-file (file-truename (expand-file-name ajc-tag-file  )))
  (if (file-exists-p  ajc-tag-file)
      (progn (shell-command (concat "chmod 444 " ajc-tag-file ) )
            (setq ajc-tag-buffer (find-file-noselect ajc-tag-file ) ) 
            ( with-current-buffer ajc-tag-buffer 
              (setq ajc-package-first-ln  (string-to-number (ajc-read-line 3)) )
              (setq ajc-class-first-ln    (string-to-number  (ajc-read-line 4) ))
              (setq ajc-member-first-ln   (string-to-number (ajc-read-line 5) ))
              (setq ajc-member-end-ln     (string-to-number (ajc-read-line 6) )) )
        (with-current-buffer ajc-tag-buffer 
            (make-variable-buffer-local 'case-fold-search )
            (setq case-fold-search nil) ))
      (message  ( concat ajc-tag-file "doesn't exists !!!" )) ) )

(defun ajc-init-when-load-first-java-file() "just add in a hook "
  (if (not ajc-all-sorted-class-items)
      (ajc-load-all-sorted-class-items-to-memory)) )

(defun ajc-reload-tag-buffer-maybe( ) 
  "check if the ajc-tag-buffer is still live ,if not reload it "
  (if (not ajc-tag-buffer) (ajc-init) )
  (if  (not (buffer-live-p ajc-tag-buffer) )
      (setq ajc-tag-buffer (find-file-noselect  ajc-tag-file)) (setq ajc-tag-buffer ajc-tag-buffer)   ))

(defun ajc-find-out-matched-pkg-item (pkg-prefix  &optional exactly_match  &optional buffer   )
  "this function is used to find out all matched packaged whose prefix is pkg-prefix 
  for example: support  pkg-prefix=javax.xm  then it will return
   '( '(\"javax.xml.bind\" 2741 2767 ) '(\"javax.xml.bind.attachment\" 2776 2778 ) ) 
if exactly_match is not nil then pkg-prefix will be seen as full package name , and
we will suppose you are searching package name = pkg-prefix , if exactly_match is set
in normal only 1 or 0 item will returned so we will try to
 convert '((packageName 12 33 )) to '(packageName 12 33 ) "
  (with-current-buffer (or buffer  (ajc-reload-tag-buffer-maybe)  )
    (let ( (line-num ajc-package-first-ln) (matched-package nil )
          (regexp-pkg-prefix (concat "^" (regexp-quote pkg-prefix )))
          (current-pkg-line    nil)   )
       (if exactly_match   (setq regexp-pkg-prefix (concat "^"  (regexp-quote  pkg-prefix )  "`" ) ))  ;;I use ` char as the separator in tag file
      (while (< line-num ajc-class-first-ln  )  
        (setq current-pkg-line (ajc-read-line line-num)  )
        (if (string-match regexp-pkg-prefix  current-pkg-line  )
            (add-to-list 'matched-package (ajc-split-pkg-item current-pkg-line)) )
        (setq line-num  (+ line-num 1 )  ) )
      (if (and   exactly_match matched-package ) (setq matched-package (car matched-package)) )
      (setq matched-package matched-package);; i don't know how to return it ,so i add this line
      ) )
  )   
(defun ajc-shrunk-matched-pkgs (pkg-prefix matched-pkg-items ) 
  "this function is used for list matched package . when you import a package in head of your java file ,
when you typed in (-|- means the cursor maybe I should call it  point) jav-|- ,
 then it will list 'java javax' instead of 'java.lang java.lang.rel javax.xml javax.xml.ws' "
  (let ( (matched-pkg-count (length matched-pkg-items))
         (current-item nil) (current-cut-string nil)
         (index 0) (index-of-dot 0) (return-list ))
    (while (< index matched-pkg-count)
      (setq current-item (nth index matched-pkg-items))
      (if (setq index-of-dot (string-match (regexp-quote ".") (car current-item)  (length pkg-prefix)  )  )
          (setq current-cut-string  (substring-no-properties (car current-item )  0   index-of-dot ))
        (setq current-cut-string (substring-no-properties (car current-item )  0 )) )
      (add-to-list 'return-list current-cut-string)
      (setq index (+ 1 index)) )
      (setq return-list return-list) ) )

(defun ajc-find-class-first-check-imported( class-name)
  "this function will find class from imported classes ,if doesn't exists  ,find from the tag file ,
if more than one class item ,then imported one of them "
  (let* ((imported-class   (ajc-caculate-all-imported-class-items ) ) (index 0) 
 (length-of-imported (length imported-class))  (matched-class-item ) (current-class-item))
    (while  (and (not matched-class-item) (< index length-of-imported) ) 
      (setq current-class-item (nth index imported-class))
      (when (string-equal class-name (car current-class-item))
        (setq matched-class-item current-class-item) )
      (setq index (+ index 1)) )
    (when (not matched-class-item  );;if not found from imported section 
      (let ((matched-class-items  (ajc-find-out-matched-class-item-without-package-prefix class-name t ) ))
        (if (< (length matched-class-items) 2) 
            (setq matched-class-item (car matched-class-items)) 
            (setq matched-class-item (car (ajc-insert-import-at-head-of-source-file matched-class-items )) ) )) )
    (setq matched-class-item matched-class-item) ) )

(defun ajc-find-out-matched-class-item (package-name class-prefix  &optional exactly_match  &optional buffer   )
  "this function is use to find out all Class whose package name is package-name 
   and ClassName is start with class-prefix 
if package-name is nil ,then try to find out all Class whose ClassName is start with class-prefix
if class-prefix is nil or empty string ,it will try to find out all Class in package package-name
if both  package-name and class-prefix  are nil then  it will return all Class in all package
the param exactly_match ,means only class name exactly equals to class-prefix will be return "
  (with-current-buffer (or buffer  (ajc-reload-tag-buffer-maybe))
    (let ((matched-pkg-item )(return-list)
          (line-num nil) (end-line-num  nil)(current-line-string ) )
      (if package-name
          (progn (setq matched-pkg-item (ajc-find-out-matched-pkg-item package-name t))
                 (if matched-pkg-item
                     (setq line-num  (nth 1 matched-pkg-item) end-line-num (nth 2 matched-pkg-item) )
                   (setq line-num   1 end-line-num  1) ) )
        (setq line-num   ajc-class-first-ln end-line-num  ajc-member-first-ln) ) 
      (if (not class-prefix) (setq class-prefix "") )
      (if exactly_match (setq regexp-class-prefix (concat "^"  (regexp-quote  class-prefix ) "`" ) )
        (setq regexp-class-prefix  (concat "^"  (regexp-quote class-prefix  )   ) ) )
      (while (< line-num end-line-num)
        (setq current-line-string (ajc-read-line line-num))
        (if (string-match regexp-class-prefix current-line-string )
            (add-to-list 'return-list (ajc-split-class-item current-line-string)) )
        (setq line-num (+ line-num 1)) )
      (setq return-list return-list) ) ) ) 

(defun ajc-find-out-matched-class-item-without-package-prefix (class-prefix &optional exactly_match )
  "actully you can use ajc-find-out-matched-class-item to do the same thing ,just let package-prefix nil
 but it is very slowly ,it need to search all the line in tag file just to find out one class item .
so this function use ajc-load-all-sorted-clas-items-to-memory to sort the class section and load it in memory
and build a index for it  ,limit : length of class-prefix must larger than 2 "
  (let ( (two-char-list-length (length two-char-list) )(two-char-item)
           (not_found t) (index 0) (matched-class-items))
    (setq case-fold-search nil)
    (if (string-match "^[A-Z][a-zA-Z]" class-prefix);; actually we only index this 
          (while  (and not_found (< index two-char-list-length ) )
               (setq two-char-item (nth index two-char-list))
               (when (string-equal (substring-no-properties class-prefix 0 2) (car two-char-item) )
                   (let* ( (start (- (nth 1 two-char-item) 1)) (end  (nth 2 two-char-item) ) 
                           (i start) (current-class-item) (regexp-class-prefix))
                     (if exactly_match (setq regexp-class-prefix (concat "^" class-prefix "$"))
                       (setq regexp-class-prefix (concat "^" class-prefix )) )
                     (while (< i end) (setq current-class-item (nth i ajc-all-sorted-class-items))
                           (if (string-match  regexp-class-prefix (car  current-class-item )  )
                               (add-to-list 'matched-class-items current-class-item t))
                     (setq i (+ i 1)) ) )
                   (setq  not_found nil);; exit while
               )
               (setq index (+ index 1)) )
      ;;actually  I only index  those class whose class name match [A-Z][a-zA-Z].
      ;; other class like   _RMIConnection_Stub should be search line by line at the class section  in tag file 
      (let ((line-num ajc-class-first-ln) (current-line-string) (regexp-class-prefix))
        (if exactly_match (setq regexp-class-prefix  (concat "^" class-prefix "`" ))              
                          (setq regexp-class-prefix  (concat "^" class-prefix  )) )
        (with-current-buffer (ajc-reload-tag-buffer-maybe)
        (while (< line-num ajc-member-first-ln)
          (setq current-line-string (ajc-read-line line-num))
          (if (string-match regexp-class-prefix current-line-string )
              (add-to-list 'matched-class-items (ajc-split-class-item current-line-string)) )
          (setq line-num (+ line-num 1)) ) )) )
      (setq matched-class-items matched-class-items) ) ) 

(defvar ajc-all-sorted-class-items nil "this is a list ,all the element are sorted class-item
this variable should work with two-char-list ,then search class is faster ")

(defun ajc-load-all-sorted-class-items-to-memory()
  (ajc-sort-class);;first sort the class ,and populate two-char-list variable
  (with-current-buffer "**ajc-tmp-sorted-class**"
    (beginning-of-buffer)
    (let ((max-line-num (line-number-at-pos (point-max)) )  (line-num 1))
      (while  (< line-num max-line-num)
        (add-to-list 'ajc-all-sorted-class-items  (ajc-split-class-item (ajc-read-line line-num)) t)
        (setq line-num (+ line-num 1)) ) ) )
(kill-buffer (get-buffer "**ajc-tmp-sorted-class**") ) )

(defvar two-char-list nil 
  "in this list ,it looks like '((Ab 1 3 ) (Ac 4 15))
  that means all class those name starts with Ab are in the position of 
  0~2 (because index from 0 not 1) in ajc-all-sorted-class-items " )

(defun ajc-sort-class ()
  "sort class for search ,we build a table for example ((Ab 1 3) (Ac 4 6) )
then we search AbstractC ,we just need to search line number from 1 3 "
     (let ((begin ) (end) (ajc-tmp-sorted-class-buffer "**ajc-tmp-sorted-class**"))
  (with-current-buffer (ajc-reload-tag-buffer-maybe)
       (setq case-fold-search nil)
    (goto-line ajc-class-first-ln)(beginning-of-line) (setq begin (point))
    (goto-line ajc-member-first-ln) (beginning-of-line) (setq end (point))
    (if (get-buffer ajc-tmp-sorted-class-buffer) (kill-buffer (get-buffer ajc-tmp-sorted-class-buffer )) )
    (append-to-buffer ajc-tmp-sorted-class-buffer begin end ) )
    (with-current-buffer ajc-tmp-sorted-class-buffer 
      (setq case-fold-search nil)
     (sort-lines nil 1 (point-max)  )
     (let ( (end ?Z) (index ?A) (index2 ?A)  (two-char)  (return-two-list)(two-char-item)(next-start-search-line-num) )
       (while  (<= index end) (setq index2 ?A)
         (while ( <= index2 ?z)
          (setq two-char (concat (char-to-string index) (char-to-string index2)  ))
          (if next-start-search-line-num
              (setq two-char-item
                   (ajc-build-map-4-search-class two-char ajc-tmp-sorted-class-buffer next-start-search-line-num))
              (setq two-char-item
                   (ajc-build-map-4-search-class two-char ajc-tmp-sorted-class-buffer 1)) )
          (if two-char-item 
          (add-to-list 'return-two-list  two-char-item  t) 
          (setq next-start-search-line-num (nth 2 two-char-item)) )
           (if (= index2 ?Z) (setq index2 ?a) (setq index2 (+ index2 1)) ) )
         (setq index (+ index 1)) )
        (setq two-char-list return-two-list) ) ) ))

(defun ajc-build-map-4-search-class (two-char-prefix ajc-tmp-sorted-class-buffer  start-search-line-num)
  "suppose two-char-prefix is 'Ab' and ajc-tmp-sorted-class-buffer is the buffer
 ,all lines in it is the classname has been sorted by classname 
(it is cut from tag file between ajc-class-first-ln and ajc-member-first-ln ,and sorted by (sort-lines))
then this function is try to find out className begin with two-char-prefix ,and got the start line-number 
and end-line-number ,record in a list ,when search class name begin with two-char-prefix ,we just need to
find it from the start line number to the end line number ,it is faster than directly searching the unsorted 
tag buffer file "
  (with-current-buffer  ajc-tmp-sorted-class-buffer
    (goto-line start-search-line-num)
    (let ((char1 ) (char2)(end-prefix-regexp )(end-line-num)
          (start nil) (end nil) (has-found-first nil) (return-item) )
      (setq case-fold-search nil)
      (setq char1 (string-to-char (substring-no-properties two-char-prefix 0 1)))
      (setq char2 (string-to-char (substring-no-properties two-char-prefix 1 2)))
      (if (or  (= char1 ?Z)  (= char2 ?z) (= char2 ?Z) )
          (setq end-line-num (line-number-at-pos (point-max)))
        (progn 
        (if (< char2 ?a) 
            (setq end-prefix-regexp (concat  "^" (char-to-string char1)
                         "[a-z" (char-to-string (+ 1 char2)) "-Z]\\|^" (char-to-string (+ char1 1)) "[a-zA-Z]"  ))
          (setq end-prefix-regexp (concat "^" (char-to-string char1)
                     "[" (char-to-string (+ 1 char2)) "-z]\\|^" (char-to-string (+ char1 1)) "[a-zA-Z]"  )) ) 
        (goto-line start-search-line-num)
        (if ( re-search-forward end-prefix-regexp  (point-max) t) 
            (setq end-line-num (point))
            (setq end-line-num (point-max)) ) ))
        (goto-line start-search-line-num)
      (add-to-list 'return-item two-char-prefix)
         (while (re-search-forward (concat "^" two-char-prefix ) (point-max) t )
                  (when (not has-found-first)    
                    (setq has-found-first t)
                    (setq start (line-number-at-pos (point))) )
                  (setq end (line-number-at-pos (point))) )
         (if (numberp start )
           (progn (setq return-item (append return-item (list start) ))
             (setq return-item (append return-item (list end )) ))
           (setq return-item nil) )
         (setq return-item return-item) )
))
(defvar matched-import-cache-list nil
  "when complete a import ,sometimes we can use the last completed items for next complete  ")
(defvar previous-matched-import-prefix nil "previous matched prefix for import Class at head of source " )

(defun ajc-import-package-candidates(  )
  "this function is the candidates , so you can bind it with a key sequence 
  it will return a list, for example '( java.lang ,java.ref)" 
  (interactive )
  (save-excursion 
    (let* (  (package-prefix ) (class-prefix )
            (line-string   (buffer-substring-no-properties (line-beginning-position) (point)))
            (matched-list nil) (matched-pkg-items)(matched-class-items)
            (index_of_last_dot))
      (setq case-fold-search nil)
      (when (string-match "^[ \t]*import[ \t]+\\([a-zA-Z_0-9_\\.]+\\)" line-string)
        (setq line-string  (match-string-no-properties 1 line-string))
        (when (and matched-import-cache-list  
                   (string-match (concat "^"  previous-matched-import-prefix   ) line-string ) )
          ;;if there are some items in cache list then try to find out from it 
          (dolist (element matched-import-cache-list)
            (if (string-match  (regexp-quote line-string)   element) (add-to-list 'matched-list element) ) ))
        (when (= (list-length matched-list ) 0 ) ;;if there are 0 matched in cache then find it out from tag files 
          (setq matched-pkg-items (ajc-shrunk-matched-pkgs line-string  (ajc-find-out-matched-pkg-item line-string) ) ) 
          (setq index_of_last_dot    (string-match "\\.[a-zA-Z_0-9]*$" line-string))
          (when index_of_last_dot
            (setq package-prefix (substring-no-properties line-string 0 index_of_last_dot))
            (setq class-prefix (substring-no-properties line-string (+ 1 index_of_last_dot)  ))
            (setq matched-class-items (ajc-find-out-matched-class-item package-prefix class-prefix)) ) 
          (setq matched-list   (append matched-list matched-pkg-items))
          (dolist ( element matched-class-items )(add-to-list 'matched-list (concat package-prefix "." (car element)))))
        (setq previous-matched-import-prefix line-string) ;;
        (setq  matched-import-cache-list matched-list) ) ) ) )

(defun ajc-find-out-class-by-parse-source ()
  "find out class in current  java source file, then will import  them if they haven't been imported   "
  (save-excursion 
    (save-match-data
      (let* ( (matched-class-strings)
            (return-type-regexp  "\\(\\([a-zA-Z0-9_]\\| *\t*< *\t*\\| *\t*>\\| *\t*, *\t*\\| *\t*\\[ *\t*]\\)+\\)" )
            (split-char-regexp "\\(,\\|<\\|>\\|]\\|\\[\\| \\|\t\\|\n\\)") );;a list of split char like ", \t<>[]"
        (beginning-of-buffer) (setq case-fold-search nil)
        (while   (search-forward-regexp   (concat  "\\bnew[ \t]+"  return-type-regexp) (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (split-string (match-string-no-properties 1 ) split-char-regexp t))) )
        (beginning-of-buffer)
        (while   (search-forward-regexp     "\\b\\([A-Z][a-zA-Z0-9_]*\\)\\.[a-zA-Z0-9_]+[ \t]*(" (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (list(match-string-no-properties 1 )))))
        (beginning-of-buffer)
        (while   (search-forward-regexp     "\\([a-zA-Z0-9_]+\\)\\.getInstance[ \t]*(" (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (list(match-string-no-properties 1 )))))
        (beginning-of-buffer)
        ;;find out all statement of variable ,for example
        ;; String name;      Map<String,<String,Ojbect>>[] map=  
        (while (search-forward-regexp       "^[ \t]*\\(public\\|private\\|static\\|final\\|native\\|synchronized\\|transient\\|volatile\\|strictfp\\| \\|\t\\)*\\(\\([a-zA-Z0-9_]\\| *\t*< *\t*\\| *\t*>\\| *\t*, *\t*\\| *\t*\\[ *\t*]\\)+\\)[ \t]+[a-zA-Z0-9_]+[ \t]*[;=]"  (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (split-string (match-string-no-properties 2 ) split-char-regexp  t))) )
        (beginning-of-buffer);; find ClassName after "catch" keywords  for example :catch(IOException e )
        (while   (search-forward-regexp "catch[ \t]*(\\([a-zA-Z0-9_]+\\)[ \t]+"  (point-max) 't)
          (setq matched-class-strings (append matched-class-strings  (list (match-string-no-properties 1 ) ))) )
        (beginning-of-buffer) ;;find method statement
        (while   (search-forward-regexp "^[ \t]*\\(public\\|private\\|static\\|final\\|native\\|synchronized\\|transient\\|volatile\\|strictfp\\| \\|\t\\)*[ \t]+\\(\\([a-zA-Z0-9_]\\|\\( *\t*< *\t*\\)\\|\\( *\t*> *\t*\\)\\|\\( *\t*, *\t*\\)\\|\\( *\t*\\[ *\t*\\)\\|\\(]\\)\\)+\\)[ \t]+[a-zA-Z0-9_]+[ \t]*(\\(.*\\))[ \t]*\\(throws[ \t]+\\([a-zA-Z0-9_, \t\n]*\\)\\)?[ \t\n]*{"  (point-max) 't)
          (let ((exception ) (returns) (params )  )
            (setq returns (match-string-no-properties 2))
            (setq  params  (match-string-no-properties 9))
            (setq exception (match-string-no-properties 11))
            ;;handle return type
            (setq matched-class-strings (append matched-class-strings  (split-string  returns "\\(,\\|<\\|>\\|]\\|\\[\\| \\|\t\\)"  t)))
;;;;handle methods parameters  ;;find out 'Map String Ojbect User' from "Map<String,Object> map,User user"
            (while  (and  params  (>  (length params ) 0 )     )
              (if (string-match "\\([a-zA-Z0-9_]\\|\\( *\t*< *\t*\\)\\|\\( *\t*>\\)\\|\\( *\t*, *\t*\\)\\|\\( *\t*\\[ *\t*\\)\\|\\(]\\)\\)+" params    )
                  (progn 
                    (setq matched-class-strings (append matched-class-strings (split-string (match-string-no-properties 0 params ) split-char-regexp t)))
                    (string-match "[ \t]*[a-zA-Z0-9_]+[ \t,]?" params  (match-end 0 )  )
                    (setq params (substring-no-properties params  (match-end 0 ) )) )
                (setq params nil) ))
            ;;handle throws Exception1,Exception2, we will exatract Exception1 Exception2 from throws sentence
       (if exception 
            (setq matched-class-strings (append matched-class-strings (split-string  exception split-char-regexp t))))))
         ;;remove primitive type and remove duplicate item
        (delete-dups matched-class-strings) (delete "" matched-class-strings)
        (dolist (ele matched-class-strings)
          (if (string-match  "\\(int\\|float\\|double\\|long\\|short\\|char\\|byte\\|void\\|boolean\\|return\\|public\\|static\\|private\\|protected\\|abstract\\|final\\|native\\|package\\)" ele )
              (delete ele matched-class-strings) ))
       (setq matched-class-strings matched-class-strings) ;;return 
        ))))

(defun ajc-caculate-all-unimported-class-items()
  "this function will find out all unimported Class itmes , it just do a subtration 
   (ajc-find-out-class-by-parse-source) -(ajc-caculate-all-imported-class-items) 
what you need to do next, is just import the unimported class  "
  (let ((imported-class-items (ajc-caculate-all-imported-class-items)   ) 
         (class-strings-in-source (ajc-find-out-class-by-parse-source) )  
         (unimported-class-items )(ele ) )
           (dolist (ele class-strings-in-source)
                   (let ((is_class_hava_imported) (index 0)) 
                     (while  (and (< index (length imported-class-items)) (not is_class_hava_imported) ) 
                           (if (string-equal ele  (car (nth index imported-class-items))) 
                               (setq  is_class_hava_imported t))  (setq index (+ index 1))  )
                     (if (not is_class_hava_imported) 
                      (setq unimported-class-items
;                           (append unimported-class-items (ajc-find-out-matched-class-item nil ele t ))))))
                    (append unimported-class-items   (ajc-find-out-matched-class-item-without-package-prefix ele t)  )))))
           (setq unimported-class-items unimported-class-items));; return
)

(defun ajc-import-all-unimported-class ()
     (interactive)
    (ajc-insert-import-at-head-of-source-file (ajc-caculate-all-unimported-class-items) )
)

(defun ajc-import-class-under-point ( )
  (interactive)
  (let ((cur-word (current-word))  )
    (when (and cur-word  (> (length cur-word) 0)   )
      (if (string-match "[^a-zA-Z0-9_]\\([a-zA-Z0-9_]+\\)$" cur-word)
          (setq cur-word (match-string-no-properties 1  cur-word )) )
      (if (string-match "^\\([a-zA-Z0-9_]+\\)[^a-zA-Z0-9_]" cur-word)
          (setq cur-word (match-string-no-properties 1  cur-word )) )
    (ajc-insert-import-at-head-of-source-file (ajc-find-out-matched-class-item-without-package-prefix cur-word t)))))

(defun ajc-insert-import-at-head-of-source-file (import-class-items-list)
  "insert 'import sentence' at head of java source file,
before that it will use y-or-n-p ask user to confirm "
(let* (    (import-class-buffer "*import-java-class*")(ele) (user-confirmed-class-items-list))
(setq case-fold-search nil)
(if (and  import-class-items-list   ( > (length import-class-items-list) 0) )
(progn 
(if ( buffer-live-p (get-buffer"*import-java-class*") ) error "already opened buffer"  )
(switch-to-buffer-other-window  import-class-buffer t)
(with-current-buffer    import-class-buffer  ;;show maybe imported Class in a new buffer 
   (dolist (ele import-class-items-list)
   (insert (concat "[ ]  "  (car (ajc-split-pkg-item-by-pkg-ln  (nth 1 ele ))) "." (car ele)  "\n")) )
   (beginning-of-buffer)(forward-char 1))
(other-window -1 )
(dolist (ele import-class-items-list ) ;;ask user whether to import the Class 
  (if (y-or-n-p (concat "import " (car ele)  "? ") )
      (progn (switch-to-buffer-other-window  import-class-buffer t)
             (add-to-list 'user-confirmed-class-items-list ele)
             (with-current-buffer    import-class-buffer 
               (beginning-of-line )(forward-char 1)(delete-char 1)
               (insert "*")(backward-char 1)
               (next-line) (other-window -1 ) ))
    (progn (switch-to-buffer-other-window  import-class-buffer t)
           (with-current-buffer   import-class-buffer 
         (beginning-of-line ) (forward-char 1)(next-line)
             (other-window -1 ))) )
)
(delete-window )(kill-buffer import-class-buffer)  ;;delete *import-java-class* buffer and window
(ajc-insert-import-at-head-of-source-file-without-confirm user-confirmed-class-items-list)
(setq user-confirmed-class-items-list user-confirmed-class-items-list) ))))

(defun ajc-insert-import-at-head-of-source-file-without-confirm (class-items)
(save-match-data  ;;insert  at head of java source
      (setq case-fold-search nil)
  (save-excursion   (beginning-of-buffer)
    (let* ((class-start (save-excursion
                (re-search-forward "\\(\\b\\(class\\|interface\\)[ \t]+[a-zA-Z0-9_]+[ \t]*{\\)"  nil 't))))
      (if (not class-start)(error "this not a java class or interface ") )
      (if(re-search-forward "^[ \t]*import[ \t]+[a-zA-Z0-9_\\.\\*]+[ \t]*;" class-start 't) 
          ;;if find 'import' insert before it 
          (progn (beginning-of-line )(insert "\n")(previous-line)
             (dolist (ele class-items)(insert 
                                      (concat "import " 
                                             (car (ajc-split-pkg-item-by-pkg-ln  (nth 1 ele )))
                                             "." (car  ele) ";\n"))))
        ;; if hasn't found 'import; then insert after 'package ' statement 
        (progn (beginning-of-buffer)
               (if (re-search-forward "^[ \t]*package[ \t]+[a-z0-9_\\.]+[ \t]*;" class-start 't)
                   (progn (next-line) (beginning-of-line)(newline)
                    (dolist (ele class-items)
                            (insert (concat "import "
                                             (car (ajc-split-pkg-item-by-pkg-ln  (nth 1 ele )))
                                             "." (car  ele) ";\n"))) )
                 (progn ;;if hasn't found 'import' and 'package' then insert at head of buffer
                   (beginning-of-buffer)
                (dolist (ele class-items)
                         (insert (concat "import "
                                           (car (ajc-split-pkg-item-by-pkg-ln  (nth 1 ele )))
                                            "." (car  ele) ";\n"))) ))) )))) )

(defun ajc-find-out-import-line ()
 "make a regex to match the packages in the import statements ,
return a list of each line string (exclude keyword 'import') "
  (let ((imported-lines))
    (save-match-data (save-excursion
        (beginning-of-buffer)
        (setq case-fold-search nil)
        (let* (  (class-start (save-excursion
           (re-search-forward "\\(\\b\\(class\\|interface\\)[ \t]+[a-zA-Z0-9_]+[ \t]*{\\)" nil 't))))
          (if (not class-start)
              (error "this not a java class or interface") )
          (while (re-search-forward "^[ \t]*import[ \t]+\\([a-zA-Z0-9_\\.\\*]+\\)[ \t]*;" class-start 't)
            (add-to-list 'imported-lines  (match-string-no-properties 1))
            (end-of-line)))) )
    (setq imported-lines imported-lines) ))

(defun ajc-caculate-all-imported-class-items (&optional exclude_java_lang)
  "find out all imported class  ,default include class in java.lang.*"
  (let ((imported-line (ajc-find-out-import-line) )(element)(index)  (return-class-items) )
    (setq case-fold-search nil)
    (dolist ( element imported-line )
      (setq index   (string-match "\\.\\*$"  element))
      (if index   ;;import a package 
         (setq return-class-items (append return-class-items 
                     (ajc-find-out-matched-class-item (substring-no-properties element 0 index) nil    ))) 
        (progn  ;;import a class 
          (string-match "^\\(.+\\)\\.\\([a-zA-Z0-9_]+\\)$" element )
          (setq return-class-items (append return-class-items  
                (ajc-find-out-matched-class-item
                      (match-string-no-properties 1 element ) (match-string-no-properties 2 element )  t ) ) ) ) ) ) 
    (if exclude_java_lang 
        (setq return-class-items return-class-items )
      (setq return-class-items  (append return-class-items  (ajc-find-out-matched-class-item "java.lang" nil )))
      ) ) )

(defun ajc-complete-constructor-candidates ()
  (interactive)
  (let ((return-matched-list));;if find keyword:new ,then do construtor complete ,then do class complete
    (if (looking-back "\\bnew[ \t]+\\([A-Z][a-zA-Z0-9_]*\\)[ \t]*([ \t]*"  (line-beginning-position) )
        (setq return-matched-list (ajc-complete-constructor (match-string-no-properties 1)))
      (if (looking-back "\\b\\([A-Z][a-zA-Z0-9_]*\\)"  ) ;;complete class name 
          (setq return-list (ajc-build-list-with-nth-on-each-element 
                             (ajc-complete-class-with-cache (match-string-no-properties 1)) 0)) ) )
      (setq return-matched-list return-matched-list) ) )

(defun ajc-complete-constructor (class-prefix)
  (let ((matched-class-item (ajc-find-out-matched-class-item-without-package-prefix class-prefix t))
          (matched-constructor-items) (return-complete-list) ) 
    ;;when matched class > 1 ,then ask user to import one of them ,
    ;;then we can got the imported class item , we complete its constructor
      (when (> (length matched-class-item ) 1 )  
        (let* ((imported-class-items ) (is-class-imported nil) (index 0)
                  (ele) (length-of-imported-class-items ) )
          (setq imported-class-items (ajc-caculate-all-imported-class-items))
          (setq length-of-imported-class-items (list-length imported-class-items))
          (while (and (not is-class-imported)   (< index length-of-imported-class-items) )
            (setq ele (nth index imported-class-items) )
                        (when (string-match (concat "^" class-prefix) (car ele)  )
                              (setq matched-class-item (list ele))  
                              (setq is-class-imported t) )
            (setq index (+ index 1)) )
          (if (not  is-class-imported )
        (setq matched-class-item  (ajc-insert-import-at-head-of-source-file matched-class-item) ) ) ) ) 
    (if (= (length matched-class-item ) 1);; when only 1 class-item ,then complete its constructor
        (let ((line-num     (nth 2 (car matched-class-item) ) )  (matching-constructor t)  
              (end-line-num (nth 3 (car matched-class-item))) (current-line) )
          (while (and matching-constructor  (< line-num end-line-num ) )
            (setq current-line (ajc-read-line line-num (ajc-reload-tag-buffer-maybe)))
            (if (string-match "^  "  current-line)   
                (add-to-list 'matched-constructor-items (ajc-split-constructor current-line)  )
                (setq matching-constructor nil) )
            (setq line-num (+ line-num 1)) )
    (dolist (constructor matched-constructor-items)
      (add-to-list 'return-complete-list (ajc-constructor-to-string constructor) t) ) ) ) 
(setq return-complete-list return-complete-list) ) )

(defun ajc-complete-class-candidates () 
  "complete class name with (current-word) as class-prefix"
  (interactive)
  (let  (    (return-list) (class-prefix)(current-line-string))
    (setq case-fold-search nil)
    (save-excursion (setq current-line-string ( ajc-read-line (line-number-at-pos (point))) ))
    (unless (string-match "\\bimport\\b"  current-line-string)
    (setq class-prefix (current-word))
    (when class-prefix  (> (length class-prefix ) 0)
          (if (string-match "[^a-zA-Z0-9_]\\([a-zA-Z0-9_]+\\)$" class-prefix)
              (setq class-prefix (match-string-no-properties 1  class-prefix )) )
      (setq return-list (ajc-build-list-with-nth-on-each-element (ajc-complete-class-with-cache class-prefix) 0)) ) ) ))

(defvar matched-class-items-cache nil  "when search class-prefix without package-name ,it will search thoudsands of lines in tags files ,so this will cache for next match maybe  ")
(defvar previous-class-prefix nil "cache last class-prefix ")

(defun ajc-complete-class-with-cache ( class-prefix )
  "find out class name starts with class-prefix ,before search tag file ,it first 
check out matched-class-items-cache to find out if ant matched class exists "
  (let  (    (return-list) )
    (setq case-fold-search nil)
    (when  (and class-prefix   (string-match "[A-Z][a-zA-Z0-9_]*" class-prefix))
      (if (and previous-class-prefix   (string-match (concat "^" previous-class-prefix ) class-prefix ))
          (dolist (class-item matched-class-items-cache ) 
            (if (string-match (concat "^" class-prefix) (car class-item)  ) (add-to-list 'return-list class-item t) ) ) 
        (setq return-list  (ajc-find-out-matched-class-item-without-package-prefix class-prefix) ))
      (when (> (length return-list) 0);; if find matched ,update cache ,or not
        (setq previous-class-prefix class-prefix)
        (setq matched-class-items-cache return-list ) ) )
    (setq return-list return-list);; return 
) )

(defun ajc-build-list-with-nth-on-each-element (list index  )
  "if params : list= '( (1 11 111) (2 22 222)) index=1 then return '(11 22 ) "
  (let ((return-list))
    (dolist (ele list) 
      (add-to-list 'return-list (nth index ele) t)  ) 
     (setq return-list return-list);;return
 ))



(defun ajc-find-members (class-item  &optional member-prefix &optional exactly_match)
  "find members(field method) under class-item which member name match member-prefix ,if member-prefix is nil or 
empty string it will return all members under class-item"
  (let ( (line-num (nth 2 class-item))  (end-line-num (nth 3 class-item)) (return-member-items)
       (regexp-method-prefix)(regexp-field-prefix) (current-line-string )) 
       (if exactly_match  
            (setq regexp-method-prefix (concat "^" member-prefix "`") 
                  regexp-field-prefix (concat "^ " member-prefix "`"))  
         (if (or (not member-prefix)  (string-equal "" member-prefix) )
            (setq regexp-method-prefix "^[a-zA-Z0-9_]" regexp-field-prefix "^ [^ ]" ) 
            (setq regexp-method-prefix (concat "^" member-prefix ) 
                  regexp-field-prefix (concat "^ " member-prefix ) ) ) )
       (with-current-buffer (ajc-reload-tag-buffer-maybe)
         (while (< line-num  end-line-num)
           (setq current-line-string (ajc-read-line line-num) )
           (if (string-match regexp-method-prefix current-line-string)
               (add-to-list 'return-member-items (ajc-split-method current-line-string ) t)
             (when (string-match regexp-field-prefix current-line-string) 
                 (add-to-list 'return-member-items (ajc-split-field current-line-string ) t) ) )
           (setq line-num (+ line-num 1)) ) ) 
          (setq return-member-items return-member-items)
          ) )

(defun ajc-caculate-class-name-by-variable(variable-name)
  "this function is used to find Class name depend on a varibale name ,for example
 the varibale-name is str ,then if exists 'String str' in source file , String will be returned "
  (let ( (matched-class-name) (variable-line-string) (index-of-var-in-line) (var-stack))
    (setq case-fold-search nil)
    (save-excursion 
      (if (search-backward-regexp  (concat "\\b\\([a-zA-Z0-9_]\\| *\t*< *\t*\\| *\t*>\\| *\t*, *\t*\\)*[ \t]+"   variable-name "\\b")   (point-min) t )
          (setq variable-line-string (ajc-read-line  ( line-number-at-pos (point) ))) 
        (when (search-forward-regexp
               (concat "\\b\\([a-zA-Z0-9_]\\| *\t*< *\t*\\| *\t*>\\| *\t*, *\t*\\)*[ \t]+"   variable-name "\\b") 
               (point-max) t)
          (setq variable-line-string (ajc-read-line  ( line-number-at-pos (point) )))
    ) ) )
    (when variable-line-string
      (setq index-of-var-in-line  (string-match  (concat "[ \t]+" variable-name "\\b")  variable-line-string))
      (setq variable-line-string (substring-no-properties  variable-line-string 0  index-of-var-in-line   ))
      (setq var-stack (split-string variable-line-string "[( \t]" t))
      (let ((tmp-list))
        (dolist (ele var-stack)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele "<"  "<"  t))) )
        (setq var-stack tmp-list) )
      (let ((tmp-list))
        (dolist (ele var-stack)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele ">"  ">"  t))) )
        (setq var-stack tmp-list) )
      (setq var-stack (nreverse var-stack ))
      (let ((top (pop var-stack) ) (parse-finished ) )
        (while  (and top (not parse-finished) )
          (when (string-match "[A-Z][a-zA-Z0-9_]*" top ) 
            (setq matched-class-name top)   (setq parse-finished t));; parse finished ,exit the  loop
          (when (string-equal ">" top) 
            (let ((e)(right-stack)) 
              (push top  right-stack)
              (setq e (pop var-stack))
              (while (and e (  > (length right-stack) 0))
                (if (string-equal "<" e ) (pop right-stack)  )
                (if (string-equal ">" e ) (push e right-stack)  )
                (setq e (pop var-stack)) ) 
              (if e    (push e var-stack) ) ) ) 
          (setq top (pop var-stack)) ))
      )
    (setq matched-class-name matched-class-name)
    )
  ) 

(defun ajc-complete-method-candidates ()
  (interactive)
  (let( (stack-list  (ajc-parse-splited-line-4-complete-method)) (is-dot-last)
      (top) (return-list)(return-string-list) )
    ( if (and stack-list (> (length stack-list) 0))
        (when (ajc-validate-splited-line-items-4-method-complete  stack-list)
          (if (= (% (length stack-list ) 2 ) 0) (setq is-dot-last t))
          (setq stack-list (remove "." stack-list ))
          (setq  top (pop stack-list))
              (let ((class-item ))
          (if (string-match "^[A-Z][a-zA-Z0-9_]*$" top)
            (setq class-item (ajc-find-class-first-check-imported  top))
            (setq class-item (ajc-find-class-first-check-imported (ajc-caculate-class-name-by-variable top)  )) )
                (while (> (length stack-list ) 1) 
                  (setq class-item  (nth 1 (car  (ajc-find-members class-item (pop stack-list) t)))) )
                 (if is-dot-last (let ((member-string (pop stack-list)))
                                     (if member-string  
                                       (setq class-item  (nth 1 (car  (ajc-find-members class-item member-string t)))) )
                                       (setq return-list (ajc-find-members class-item   )) )
                  (setq return-list (ajc-find-members class-item   (pop stack-list) )) ) )
 ) ) 
;    (setq return-list return-list)
(dolist (member return-list);; translate item to string
  (if (= 2  (length member ) );; lenth of field is 2 (only field and returntype )
      (add-to-list 'return-string-list   (ajc-field-to-string member)  t)
      (add-to-list 'return-string-list   (ajc-method-to-string member ) t)  ) ) 
(setq return-string-list return-string-list)
) ) 

(defun ajc-validate-splited-line-items-4-method-complete (stack-list)
"('System' '.') return true, ('System' '.' 'ou' ) return true,
 ('System' '.' 'out' '.' 'pri') return  true"
  (let ((current-item (car stack-list) ) (validate t) (index 1)(next-item) )
    (if (and (> (length stack-list) 1)  (string-match "^[a-zA-Z0-9_]+$" current-item ))
        (while (and validate current-item  )
          (setq next-item (nth index stack-list))
          (if (string-match "^[a-zA-Z0-9_]+$" current-item )
              (if next-item (if (not (string-equal "." next-item) ) (setq validate nil)   )) )
          (if (string-equal "." current-item )
              (if next-item (if (not (string-match "^[a-zA-Z0-9_]+$" next-item) ) (setq validate nil)   )) )
          (setq current-item next-item)
          (setq index (+ 1 index))
          )    
      (setq validate nil) )
    (setq validate validate) ) )

(defun ajc-parse-splited-line-4-complete-method ()
  " parse current line  for complete method  ,suppose current line is
System.getProperty(str.substring(3)).to  
first ajc-split-line-4-complete-method will split this line to 
'System' '.' 'getProperty' '(' 'str' '.' 'substring' '(' '3' ')' ')' '.' 'to'
ajc-remove-unnecessary-items-4-complete-method will remove anything between ( and )  ,so only
'System'  '.' 'getProperty'  '.'  'to'  is left "  
  (let* ( (line-string (buffer-substring-no-properties (line-beginning-position) (point)))
          (splited-line-items (ajc-split-line-4-complete-method line-string)) )
    (ajc-remove-unnecessary-items-4-complete-method splited-line-items ) ) )

(defun ajc-remove-unnecessary-items-4-complete-method (splited-line-items) 
" System.getProperty(str.substring(3)).to  
first ajc-split-line-4-complete-method will split this line to 
'System' '.' 'getProperty' '(' 'str' '.' 'substring' '(' '3' ')' ')' '.' 'to'
this function will remove anything between ( and )  ,so only
'System'  '.' 'getProperty'  '.'  'to'  is left "
  (let* (  (stack-list)(ele) (reverse-current-line-split-list  (reverse splited-line-items)) (parse-finished) )
    (setq ele (pop reverse-current-line-split-list))
    (while  (and ele (not parse-finished) )
      (if  (or (string-equal ";" ele) (string-equal "(" ele ) ) (setq parse-finished t);; parse finished ,exit the  loop
          (if (string-equal ")" ele) 
              (let ((e)(right-stack)) 
                (push ele  right-stack)
                (setq e (pop reverse-current-line-split-list))
                (while (and e (  > (length right-stack) 0))
                  (if (string-equal "(" e ) (pop right-stack)  )
                  (if (string-equal ")" e ) (push e right-stack)  )
                  (setq e (pop reverse-current-line-split-list)) ) 
                (if e    (push e reverse-current-line-split-list) ) )
              (push ele stack-list) 
            ) )
      (setq ele (pop reverse-current-line-split-list)) )
    (setq stack-list stack-list)
      ) )
;; (defun ajc-replace-keyword-with-its-class-name()
;;   (save-excursion 
;;     (let ((class-name)))
;;     (setq case-fold-search nil)
;;     (if (search-backward-regexp  "\\bclass[ \t]+\\([A-Z][a-zA-Z0-9_]*\\)\\b"   (point-min) t )
;;         (setq class-name (match-string-no-properties 1 ))
;;       ) )
;;   )
(defun ajc-split-line-4-complete-method(line-string  )
  "this function is used to complete method ,first this function will split line-string to small items 
for example : suppose line-string is 
System.getProperty(str.substring(3)).to  
then this function split it to
'System' '.' 'getProperty' '(' 'str' '.' 'substring' '(' '3' ')' ')' '.' 'to' "
  (save-excursion 
    (let* (  (stack-list nil) ) 
      (setq case-fold-search nil)
        (setq line-string  (replace-regexp-in-string   "\\\\\"" "'"       line-string)) 
        (setq line-string  (replace-regexp-in-string   "\".*?\"" "String" line-string)) 
;        (setq line-string  (replace-regexp-in-string   "\\bnew\\b"    ""  line-string)) 
        (setq line-string  (replace-regexp-in-string   "\\breturn\\b" ""  line-string)) 
        (setq line-string  (replace-regexp-in-string   "\\this\\b" ""  line-string)) 
        (while (string-match "=\\(.*\\)" line-string)
          (setq line-string (match-string-no-properties 1 line-string)) )
       ;;split line-string with "." ,but add "." as an element at its position in list
      (setq stack-list (ajc-split-string-with-separator  line-string "[ \t]*\\.[ \t]*"  "." t))
       ;;split each element  with "(" ,but add "(" as an element at its position in list 
      ;;and merge all the list in a list 
      (let ((ele)(tmp-list))
           (dolist (ele stack-list)
            (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele "("  "("  t))) )
           (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele ")"  ")"  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele "\\["  "("  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele "]"  ")"  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele "{"  "("  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele "}"  ")"  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele "<"  "("  t))) )
        (setq stack-list tmp-list) )
      (let( (ele)(tmp-list) )
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele ">"  ")"  t))) )
        (setq stack-list tmp-list) )
            (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele ","  ";"  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (ajc-split-string-with-separator ele ";"  ";"  t))) )
        (setq stack-list tmp-list) )
      (let ((ele)(tmp-list))
        (dolist (ele stack-list)
          (setq tmp-list (append tmp-list (split-string ele "[ \t]+"  t))) )
        (setq stack-list tmp-list) )
      (setq stack-list stack-list )
      ) ) )

(defun ajc-java-keywords-candidates ()
  (let ((keywords))
            (setq keywords (list "public" "protected"  "private" "native" "final" "synchronized" "transient" "abstract"  "static" "import" "this" "if" "else" "else if" "break" "case" "switch"  "continue" "class" "interface" "package" "new" "try" "catch" "finally" "super" "void"  "int" "float" "double" "short" "char" "byte" "long" "boolean" "enum" "intanceof"  "for" "while" "throw" "throws"  "extends" "implements" ))
    ) )
(provide 'ajc-java-complete)

;; End.

