;;! target = "x86_64"
;;! test = "winch"
(module
  (func (export "as-br-if-last") (result i32)
    (block (result i32) (br_if 0 (i32.const 2) (loop (result i32) (i32.const 1))))
  )
)
;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    8(%rdi), %r11
;;       movq    0x10(%r11), %r11
;;       addq    $0x10, %r11
;;       cmpq    %rsp, %r11
;;       ja      0x4a
;;   1c: movq    %rdi, %r14
;;       subq    $0x10, %rsp
;;       movq    %rdi, 8(%rsp)
;;       movq    %rsi, (%rsp)
;;       movl    $1, %ecx
;;       movl    $2, %eax
;;       testl   %ecx, %ecx
;;       jne     0x41
;;   41: addq    $0x10, %rsp
;;       popq    %rbp
;;       retq
;;   4a: ud2
