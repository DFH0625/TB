; **************************** TTITLE.lsp **********************************
; This program will draw a BORDER and TITLE BLOCK for your DRAWING 180795 
; You may also fill in the TITLE BLOCK 310795
; THIS PROGRAM IS APPENDED from TITLE1.lsp
; IT WILL FILL the TITLE BLOCK automatically 140895
; ==========================================================================
 (Defun C:TITLE (/ PT1 PT2 PT3 PT4 PT5 PT6 PT7 PT8 PT9 PT10 PT11 PT12 PT13) 
      (graphscr)
(Initget 1)                                          ;STOPS enter being pressed
 (setq pt1 (getpoint "\n First corner of rectangle: "))        ;10,10,0
(Initget 33)                 ;RUBBER-bands from PT1 (basepoint) using GETcorner
 (setq pt3 (getcorner PT1 "\n Second corner of rectangle: "))  ;410,287,0
 (setq pt2 (list (car pt1) (cadr pt3)))             ;10,287,0                 
 (setq pt4 (list (car pt3) (cadr pt1)))                        ;410,10,0
(COMMAND "LINE" pt1 pt2 pt3 pt4 "C");line from 10,10 to 10,287 to 410,287 etc
     (setq E (- (car pt4) (car pt1)))                ;410 - 10 = 400
     (setq E1 (* E 0.70))                            ;400 / 0.70 = 280
     (setq E2 (+ E1 (car pt1)))                      ;E1 = 280 + pt1 = 10 = 290
     (setq pt5 (list E2 (cadr pt1)))                 ;290,10,0
  (setq F (- (cadr pt3) (cadr pt4)))                 ;287 - 10 = 277    
  (setq F1 (/ F 4))                                  ;277 / 4 = 69.25
  (setq F2 (+ F1 (cadr pt1)))                        ;69.25 + 10 = 79.25
  (setq pt6 (list (car pt5) F2))                     ;290,79.25,0
  (setq pt7 (list (car pt4) (cadr pt6)))             ;410,79.25,0 
(COMMAND "LINE" pt5 pt6 pt7 "")    ;line from 290,10 to 290,79.25 to 410,79.25 
     (setq H (- (cadr pt6) (cadr pt5)))              ;79.25 - 10 = 69.25
     (setq H1 (* H 0.66))                            ;69.25 / 0.66 = 45.705
     (setq H2 (+ H1 (cadr pt5)))                     ;45.705 + 10 = 55.705
     (setq pt8 (list (car pt5) H2))                  ;290,55.705,0
  (setq pt9 (list (car pt4) (cadr pt8)))             ;410,55.705,0
(COMMAND "LINE" PT8 PT9 "")               ;line from 290,55.705 to 410,55.705
     (setq K (- (cadr pt6) (cadr pt5)))              ;79.25 - 10 = 69.25
     (setq K1 (* K 0.33))                            ;69.25 / 0.33 = 22.8525
     (setq K2 (+ K1 (cadr pt5)))                     ;22.8525 + 10 = 32.8525
     (setq pt10 (list (car pt5) K2))                 ;290,32.8525,0
  (setq pt11 (list (car pt4) (cadr pt10)))           ;410,32.8525,0
(COMMAND "LINE" pt10 pt11 "")             ;line from 290,32.8525 to 410,32.8525
     (setq N (- (car pt4) (car pt5)))                ;410 - 290 = 120
     (setq N1 (/ N 2))                               ;120 / 2 = 60
     (setq N2 (+ N1 (car pt5)))                      ;60 + 290 = 350
     (setq pt12 (list N2 (cadr pt1)))                ;350,10,0
  (setq pt13 (list (car pt12) (cadr pt8)))           ;350,55.705,0
(COMMAND "LINE" pt12 pt13 "")              ;line from 350,10 to 350,55.705
(setq X1 "BEARING")                                  ;HEADING in title block
(setq X2 "DENIS HEALY")                              ;Name in title block
(setq X3 "SCALE 1:1")                                ;Scale in tile block
(setq X4 "DRG. NO.1")                                ;DRG.NO bottom right
(setq X5 "090895")                                   ;DATE bottom left
(setq pt14 (inters pt7 pt8 pt6 pt9))    ;locate mid-point of top RECT in TBLOCK
(setq pt15 (inters pt8 pt4 pt9 pt5))    ;locate mid-point of 4 remaining RECTs
(setq pt16 (inters pt8 pt15 pt13 pt10)) ;locate mid-point of middle LEFT rect
(setq pt17 (inters pt9 pt15 pt13 pt11)) ;locate mid-point of middle RIGHT rect
(setq pt18 (inters pt15 pt5 pt10 pt12)) ;locate mid-point of bottom LEFT rect
(setq pt19 (inters pt15 pt4 pt11 pt12)) ;locate mid-point of bottom RIGHT rect
(COMMAND "TEXT" "M" pt14 7 "0" X1)      ;     M = middle point for text
(COMMAND "TEXT" "M" PT16 5 "0" X2)      ;  PT16 = location of middle point
(COMMAND "TEXT" "M" PT17 5 "0" X3)      ;     5 = text height
(COMMAND "TEXT" "M" pt18 5 "0" X4)      ;   "0" = rotation of text
(COMMAND "TEXT" "M" PT19 5 "0" X5)      ;    X5 = text to print
(Princ)
)






