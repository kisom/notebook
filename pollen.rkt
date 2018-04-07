#lang racket/base

(require racket/date txexpr)
(require pollen/tag)
(require pollen/decode)

(provide (all-defined-out))

(define (link url text) `(a [[href ,url]] ,text))
