shots_data <- read.csv("C:\\Users\\Dillon\\Desktop\\shots_data.csv")

a_two_attempt <- 0
a_nc_three_attempt <- 0
a_c_three_attempt <- 0
a_two_made <- 0
a_nc_three_made <- 0
a_c_three_made <- 0

b_two_attempt <- 0
b_nc_three_attempt <- 0
b_c_three_attempt <- 0
b_two_made <- 0
b_nc_three_made <- 0
b_c_three_made <- 0

for (row in 1:nrow(shots_data)) {
    distance <- sqrt((shots_data[row, "x"])^2 + (shots_data[row, "y"])^2)
    if (shots_data[row, "y"] <= 7.8 ) {
        if (distance > 22) {
	    if (shots_data[row, "team"] == "Team A") {
		a_c_three_attempt <- a_c_three_attempt + 1
	    } else {
		b_c_three_attempt <- b_c_three_attempt + 1
	    }
	    if (shots_data[row, "fgmade"] == 1) {
		if (shots_data[row, "team"] == "Team A") {
	            a_c_three_made <- a_c_three_made + 1
	    	} else {
		    b_c_three_made <- b_c_three_made + 1
	    	}
	    }
        } else {
            if (shots_data[row, "team"] == "Team A") {
		a_two_attempt <- a_two_attempt + 1
	    } else {
		b_two_attempt <- b_two_attempt + 1
	    }
	    if (shots_data[row, "fgmade"] == 1) {
		if (shots_data[row, "team"] == "Team A") {
	            a_two_made <- a_two_made + 1
	    	} else {
		    b_two_made <- b_two_made + 1
	    	}
	    }
        }
    } else {
        if (distance > 23.75) {
            if (shots_data[row, "team"] == "Team A") {
		a_nc_three_attempt <- a_nc_three_attempt + 1
	    } else {
		b_nc_three_attempt <- b_nc_three_attempt + 1
	    }
	    if (shots_data[row, "fgmade"] == 1) {
		if (shots_data[row, "team"] == "Team A") {
	            a_nc_three_made <- a_nc_three_made + 1
	    	} else {
		    b_nc_three_made <- b_nc_three_made + 1
	    	}
	    }
        } else {
            if (shots_data[row, "team"] == "Team A") {
		a_two_attempt <- a_two_attempt + 1
	    } else {
		b_two_attempt <- b_two_attempt + 1
	    }
	    if (shots_data[row, "fgmade"] == 1) {
		if (shots_data[row, "team"] == "Team A") {
	            a_two_made <- a_two_made + 1
	    	} else {
		    b_two_made <- b_two_made + 1
	    	}
	    }
        }
    }
}
a_efg_twopt <- (a_two_made / a_two_attempt)
a_efg_c_threept <- ((a_c_three_made + (0.5 * a_c_three_made)) / a_c_three_attempt)
a_efg_nc_threept <- ((a_nc_three_made + (0.5 * a_nc_three_made)) / a_nc_three_attempt)

b_efg_twopt <- (b_two_made / b_two_attempt)
b_efg_c_threept <- ((b_c_three_made + (0.5 * b_c_three_made)) / b_c_three_attempt)
b_efg_nc_threept <- ((b_nc_three_made + (0.5 * b_nc_three_made)) / b_nc_three_attempt)


a_fga <- a_two_attempt + a_c_three_attempt + a_nc_three_attempt
a_two_per <- a_two_attempt/ a_fga
a_c_three_per <- a_c_three_attempt/ a_fga
a_nc_three_per <- a_nc_three_attempt/ a_fga

b_fga <- b_two_attempt + b_c_three_attempt + b_nc_three_attempt
b_two_per <- b_two_attempt/ b_fga
b_c_three_per <- b_c_three_attempt/ b_fga
b_nc_three_per <- b_nc_three_attempt/ a_fga

print(a_efg_twopt)
print(a_efg_c_threept)
print(a_efg_nc_threept)
print(a_two_per)
print(a_c_three_per)
print(a_nc_three_per)

print(b_efg_twopt)
print(b_efg_c_threept)
print(b_efg_nc_threept)
print(b_two_per)
print(b_c_three_per)
print(b_nc_three_per)