reihenfolge <- read.csv(file = "C:/Users/jab49wd/iCloudDrive/Geteilt/richtige_reihenfolge.csv")
o_table <- read.csv(file = "C:/Users/jab49wd/iCloudDrive/Geteilt/overview.csv")

liste <- seq(1, 100, by = 1)

n_list <- c(50, 100, 200, 500)

test_1 <- merge(liste, n_list, sort = FALSE)

test_2 <- merge(test_1, reihenfolge, sort = FALSE)

a_list <- unique(reihenfolge$a)
c_list <- unique(reihenfolge$c)

test_5 <- merge(c_list, a_list)

test_1 <- merge(liste, n_list, sort = FALSE)

test_2 <- merge(test_1, reihenfolge, sort = FALSE)

library(dplyr)
rename(test_5, c_new = x, a_new = y)

test_3 <- cbind(test_5, o_table)



