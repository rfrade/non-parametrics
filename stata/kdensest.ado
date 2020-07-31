program drop kdensest
program define kdensest, rclass
        version 16
	syntax varlist , eval_point(real) bandwidth(real) kerntype(string)
	
	tempvar x
	gen `x' = `1' // 1st parameter of varlist
	
	tempvar H 
	gen `H' = `bandwidth'
	
	tempvar z
	gen `z' = (`x'-`eval_point')/`H'

	// calculates kernel and excludes values out of -1 < z < 1
	tempvar kern
	gen `kern' = 0.75*(1-`z'^2)*(`z' > -1)*(`z' < 1)

	tempvar sum_kern
	egen `sum_kern' = sum(`kern')
	
	count // necessary to use r(N)
	scalar fhat = (1/(r(N)*`H'))*`sum_kern'
	di fhat

end
