clear

set obs 200

gen x = rchi2(2)
//gen y = rchi2(20)

*bandwidth
local h = 2

*points to evaluation: 1 to 6 by 0.1
*egen eval_points = seq(), from(10) to(60)
*replace eval_points = `eval_points' / 10

kdensest x, eval_point(1.5) bandwidth(`h') kerntype("epa")
