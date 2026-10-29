# Project: PVT1 and E-cadherin in Breast Cancer
# Purpose: Data setup and organization
# Language: R

# Step 1: Check the current working directory
getwd()
R.version.string
ls()
#create a small practice data frame
patient_data <- data.frame(
  patient_ID=c("p001","p002","p003"),
  Age=c(45, 52, 38),
  Group=c("control", "cancer", "cancer")
)
str(patient_data)
dim(patient_data)
table(patient_data$Group)
patient_data$Group <- factor(patient_data$Group)
str(patient_data)
table(patient_data$Group)
patient_data$severity<-factor(
  c("severe", "Mild", "Mild"),
  levels=c("Mild","Moderate","severe"),
  ordered = TRUE
)
str(patient_data)
grade<- c("G1","G2","G2","G3","G2","G3")
genotype<- c("CC","CT","CC","TT","CT","TT")
#Count Patients in each Combination
genotype_table<- table(grade,genotype)
genotype_table
fisher.test(genotype_table)
genotype_grade<- data.frame(
  Grade=c("G1","G2","G3"),
  CC= c(1, 39, 13),
  CT = c(2, 28, 9),
  TT = c(0, 7, 1)
)
rowSums(genotype_grade[, -1])
sum(genotype_grade[, -1], na.rm = TRUE)
round(prop.table(as.matrix(genotype_grade[, -1]), margin = 1)*100, 1)
fisher.test(as.matrix(genotype_grade[, -1]))
install.packages("rcompanion")
library(rcompanion)
cramerV(as.matrix(genotype_grade[, -1]))



























