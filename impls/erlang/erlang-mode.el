(require 'generic)
(define-generic-mode erlang-mode
  ;; comment-list
  '("%")
  ;; keyword-list
  '("case" "of" "end")
  ;; font-lock-list
  nil
  ;; auto-mode-list
  '("\\.erl\\'")
  ;; function-list
  nil
  ;; docstring
  "Major mode for Erlang")
