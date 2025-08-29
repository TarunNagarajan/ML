# 01: Create a data frame with students names, marks in 3 subjects
# calculate the average marks for each student.
# [COMPLETE]

df <- data.frame(
  subjects = c("Physics", "Chemistry", "Math"),
  student_01 = c(99, 97.4, 93.2),
  student_02 = c(100, 67.8, 67.5),
  student_03 = c(45, 67, 90)
)

# names_df

mean_student_01 = mean(df$student_01)
mean_student_02 = mean(df$student_02)
mean_student_03 = mean(df$student_03)

cat("Mean of student 1: ", mean_student_01, "\n")
cat("Mean of student 2: ", mean_student_02, "\n")
cat("Mean of student 3: ", mean_student_03, "\n")
