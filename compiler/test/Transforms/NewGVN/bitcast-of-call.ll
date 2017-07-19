; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -newgvn -S | FileCheck %s
; PR2213

define i32* @f(i8* %x) {
; CHECK-LABEL: @f(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP:%.*]] = call i8* @m(i32 12)
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast i8* [[TMP]] to i32*
; CHECK-NEXT:    ret i32* [[TMP1]]
;
entry:
  %tmp = call i8* @m( i32 12 )            ; <i8*> [#uses=2]
  %tmp1 = bitcast i8* %tmp to i32*                ; <i32*> [#uses=0]
  %tmp3 = bitcast i32* %tmp1 to i8*
  %tmp2 = bitcast i8* %tmp3 to i32*                ; <i32*> [#uses=0]
  ret i32* %tmp2
}

declare i8* @m(i32)
