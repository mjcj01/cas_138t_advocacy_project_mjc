library(tidyverse)

afr_adm_expenditures_2010_11 <- read.csv("C:\\Users\\micha\\Documents\\Spring 2022\\CAS 138T\\Advocacy Project\\Advocacy Project Directory\\Data\\Finances AFR Expenditures 2010-2011.csv") %>%
  select(School.District,County,Total.Exp.per.ADM)
afr_adm_expenditures_2011_12 <- read.csv("C:\\Users\\micha\\Documents\\Spring 2022\\CAS 138T\\Advocacy Project\\Advocacy Project Directory\\Data\\Finances AFR Expenditures 2011-2012.csv") %>%
  select(School.District,County,Total.Exp.per.ADM)
afr_adm_expenditures_2012_13 <- read.csv("C:\\Users\\micha\\Documents\\Spring 2022\\CAS 138T\\Advocacy Project\\Advocacy Project Directory\\Data\\Finances AFR Expenditures 2012-2013.csv") %>%
  select(School.District,County,Total.Exp.per.ADM)
afr_adm_expenditures_2013_14 <- read.csv("C:\\Users\\micha\\Documents\\Spring 2022\\CAS 138T\\Advocacy Project\\Advocacy Project Directory\\Data\\Finances AFR Expenditures 2013-2014.csv") %>%
  select(School.District,County,Total.Exp.per.ADM)
afr_adm_expenditures_2014_15 <- read.csv("C:\\Users\\micha\\Documents\\Spring 2022\\CAS 138T\\Advocacy Project\\Advocacy Project Directory\\Data\\Finances AFR Expenditures 2014-2015.csv") %>%
  select(School.District,County,Total.Exp.per.ADM)
afr_adm_expenditures_2015_16 <- read.csv("C:\\Users\\micha\\Documents\\Spring 2022\\CAS 138T\\Advocacy Project\\Advocacy Project Directory\\Data\\Finances AFR Expenditures 2015-2016.csv") %>%
  select(School.District,County,Total.Exp.per.ADM)
afr_adm_expenditures_2016_17 <- read.csv("C:\\Users\\micha\\Documents\\Spring 2022\\CAS 138T\\Advocacy Project\\Advocacy Project Directory\\Data\\Finances AFR Expenditures 2016-2017.csv") %>%
  select(LEA.Name,County,Total.Exp.per.ADM)
afr_adm_expenditures_2017_18 <- read.csv("C:\\Users\\micha\\Documents\\Spring 2022\\CAS 138T\\Advocacy Project\\Advocacy Project Directory\\Data\\Finances AFR Expenditures 2017-2018.csv") %>%
  select(School.District,County,Total.Exp.per.ADM)
afr_adm_expenditures_2018_19 <- read.csv("C:\\Users\\micha\\Documents\\Spring 2022\\CAS 138T\\Advocacy Project\\Advocacy Project Directory\\Data\\Finances AFR Expenditures 2018-2019.csv") %>%
  select(School.District,County,Total.Exp.per.ADM)
afr_adm_expenditures_2019_20 <- read.csv("C:\\Users\\micha\\Documents\\Spring 2022\\CAS 138T\\Advocacy Project\\Advocacy Project Directory\\Data\\Finances AFR Expenditures 2019-2020.csv") %>%
  select(School.District,County,Total.Exp.per.ADM)

afr_adm_expenditures_2010_11$Year <- as.numeric("2011")
afr_adm_expenditures_2011_12$Year <- as.numeric("2012")
afr_adm_expenditures_2012_13$Year <- as.numeric("2013")
afr_adm_expenditures_2013_14$Year <- as.numeric("2014")
afr_adm_expenditures_2014_15$Year <- as.numeric("2015")
afr_adm_expenditures_2015_16$Year <- as.numeric("2016")
afr_adm_expenditures_2016_17$Year <- as.numeric("2017")
afr_adm_expenditures_2017_18$Year <- as.numeric("2018")
afr_adm_expenditures_2018_19$Year <- as.numeric("2019")
afr_adm_expenditures_2019_20$Year <- as.numeric("2020")

colnames(afr_adm_expenditures_2016_17) <- c("School.District", "County", "Total.Exp.per.ADM", "Year")

afr_expenditures_all <- rbind(afr_adm_expenditures_2010_11,afr_adm_expenditures_2011_12,afr_adm_expenditures_2012_13,
                              afr_adm_expenditures_2013_14,afr_adm_expenditures_2014_15,afr_adm_expenditures_2015_16,
                              afr_adm_expenditures_2016_17,afr_adm_expenditures_2017_18,afr_adm_expenditures_2018_19,
                              afr_adm_expenditures_2019_20)

