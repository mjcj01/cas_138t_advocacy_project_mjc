library(tidyverse)

`Minimum Expenditures per Student in PA` <- c(min(afr_adm_expenditures_2010_11$Total.Exp.per.ADM),min(afr_adm_expenditures_2011_12$Total.Exp.per.ADM),
                                              min(afr_adm_expenditures_2012_13$Total.Exp.per.ADM),min(afr_adm_expenditures_2013_14$Total.Exp.per.ADM),
                                              min(afr_adm_expenditures_2014_15$Total.Exp.per.ADM),min(afr_adm_expenditures_2015_16$Total.Exp.per.ADM),
                                              min(afr_adm_expenditures_2016_17$Total.Exp.per.ADM),min(afr_adm_expenditures_2017_18$Total.Exp.per.ADM),
                                              min(afr_adm_expenditures_2018_19$Total.Exp.per.ADM),min(afr_adm_expenditures_2019_20$Total.Exp.per.ADM))
`Maximum Expenditures per Student in PA` <- c(max(afr_adm_expenditures_2010_11$Total.Exp.per.ADM),max(afr_adm_expenditures_2011_12$Total.Exp.per.ADM),
                                              max(afr_adm_expenditures_2012_13$Total.Exp.per.ADM),max(afr_adm_expenditures_2013_14$Total.Exp.per.ADM),
                                              max(afr_adm_expenditures_2014_15$Total.Exp.per.ADM),max(afr_adm_expenditures_2015_16$Total.Exp.per.ADM),
                                              max(afr_adm_expenditures_2016_17$Total.Exp.per.ADM),max(afr_adm_expenditures_2017_18$Total.Exp.per.ADM),
                                              max(afr_adm_expenditures_2018_19$Total.Exp.per.ADM),max(afr_adm_expenditures_2019_20$Total.Exp.per.ADM))
Year <- c(2011,2012,2013,2014,2015,2016,2017,2018,2019,2020)

diff_exp <- data.frame(`Maximum Expenditures per Student in PA`,`Minimum Expenditures per Student in PA`,Year)

diff_exp_plot <- ggplot(data = diff_exp, aes(x = Year)) +
  geom_line(aes(y = `Maximum Expenditures per Student in PA`)) +
  geom_line(aes(y = `Minimum Expenditures per Student in PA`)) +
  scale_x_continuous(breaks = c(2011,2012,2013,2014,2015,2016,2017,2018,2019,2020)) +
  theme(
    panel.grid.minor = element_blank()
  )
diff_exp_plot
