schooldistrict <- schooldistrictInput()
ggplot(schooldistrict, aes(x = FullDate, y = Total.Exp.per.ADM)) +
  geom_line() +
  geom_label(aes(label = Total.Exp.per.ADM)) +
  labs(x = "Year", y = "Spending per Student (in USD)") +
  scale_x_date(date_labels = "%Y", limits = as.Date(c("2010-1-1", "2021-1-1")))