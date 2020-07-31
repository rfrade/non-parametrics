clear
set obs 1000
gen x = 5*runiform()

gen mean_y_x = x*(x <= 0.5) + 1/(4*x)*(x>0.5)

gen epsilon = rnormal()

gen y = mean_y_x + epsilon

// bandwidth = .5
loclinreg y x, eval_point(1) bandwidth(0.5) kerntype("epa")
