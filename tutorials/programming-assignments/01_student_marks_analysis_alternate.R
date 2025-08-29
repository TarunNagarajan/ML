# 01: Create a data frame with students names, marks in 3 subjects
# calculate the average marks for each student.
# [COMPLETE]

df <- data.frame(
  subjects = c("Physics", "Chemistry", "Math"),
  student_01 = c(99, 97.4, 93.2),
  student_02 = c(100, 67.8, 67.5),
  student_03 = c(45, 67, 90)
)

transposed_df <- t(df[, -1])
student_means_transposed <- rowMeans(transposed_df)
print(student_means_transposed)

