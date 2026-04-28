set.seed(123)
n<- 50
patient_data <- data.frame(
  patient_id = 1:n,
  age= sample(5:70, n, replace= TRUE),
  gender= sample(c("M", "F"), n, replace= TRUE),
  treatment_grp= sample(c("D", "P"), n, replace= TRUE),
  bp= round(rnorm(n, 120, 15 ))
)

write.csv(patient_data, "patient_data.csv", row.names = FALSE )
filtered_data <- subset(patient_data, age > 30)

filtered_data$bp_category <- ifelse(
  filtered_data$bp > 130,
  "High",
  "Normal"
)
summary(filtered_data)

aggregate(bp ~ treatment_grp,
          data = filtered_data,
          mean)
hist(filtered_data$age,
     col = "skyblue",
     main = "Age Distribution")
boxplot(bp ~ treatment_grp,
        data = filtered_data,
        col = c("orange", "green"),
        main = "Blood Pressure by Treatment")

