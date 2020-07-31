program drop loclinreg
program define loclinreg, rclass
        version 16
	syntax varlist, eval_point(real) bandwidth(real) kerntype(string)

	tempvar y
	gen `y' = `1' // 1st parameter of varlist

	tempvar x
	gen `x' = `2' // 2st parameter of varlist

	tempvar H 
	gen `H' = `bandwidth'
	
	tempvar z
	gen `z' = (`x'-`eval_point')/`H'

	// calculates kernel and excludes values out of -1 < z < 1
	tempvar kern
	gen `kern' = 0.75*(1-`z'^2)*(`z' > -1)*(`z' < 1)

	tempvar kern2
	gen `kern2' = `kern'^0.5

	tempvar ystar
	gen `ystar' = `kern2'*`y'
	gen `xstar' = `kern2'*`x'
	// see if it is possible to treat multivariable x
	
	//WLS
	scalar beta = (`xstar'*`xstar')^(-1)*`xstar'*`ystar'
	di beta

end
