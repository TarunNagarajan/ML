df <- data.frame(
  EmployeeID = 101:112,
  FirstName = c("John", "Jane", "Peter", "Mary", "Chris", "Vivian", "Tom", "Ava", "Leo", "Mia", "Ken", "Sara"),
  LastName = c("Smith", "Doe", "Jones", "Williams", "Brown", "Lee", "Garcia", "Davis", "Miller", "Wilson", "Moore", "Taylor"),
  Department = c("Engineering", "Marketing", "Engineering", "HR", "Sales", "Marketing", "Engineering", "HR", "Sales", "Marketing", NA, "Sales"),
  StartDate = c("2022-08-15", "2021-11-20", "2022-08-15", "2020-03-10", "2023-01-05", "2022-05-30", "2024-02-01", "2021-09-01", "2023-01-05", "2023-07-19", "2022-12-12", "2021-11-20"),
  Salary = c(95000, 78000, 105000, 62000, 85000, 81000, 99000, 65000, NA, 79000, 115000, 88000),
  PerformanceRating = factor(c("Good", "Excellent", "Excellent", "Average", "Good", "Good", "Good", "Excellent", "Average", "Good", "Excellent", NA), levels = c("Average", "Good", "Excellent")),
  OnProject = c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE)
)

print(df)

str(df)

df <- na.omit(df)
df[df$Department == "Marketing", ]

df <- na.omit(df)
df[df$PerformanceRating == "Excellent" & df$Department == "Engineering", ]

str(df)
df$StartDate <- as.Date(df$StartDate, format = "%Y-%m-%d") 
str(df)

df[df$StartDate < "2022-01-01", c("FirstName", "LastName", "Salary")]

df[df$Salary == max(df$Salary, na.rm = TRUE), ]
rows <- nrow(df)
rows

df[(rows-3):rows, ]
df[df$FirstName == "Vivian", "Salary"] <- 89000
df

df$Salary[df$Department == "Sales"] <- df$Salary[df$Department == "Sales"] + 2000
df

df$YearsOfService <- 2025 - as.numeric(substr(df$StartDate, 1, 4))
df

df[is.na(df$Salary)]
employees_complete <- na.omit(df)
employees_complete

sorted_by_start_date <- df[order(df$StartDate, decreasing = TRUE), , drop = FALSE]
sorted_by_start_date

df[order(df$Department, -df$Salary, decreasing = FALSE), , drop = FALSE]

table(df$PerformanceRating)
table(df$Department)

df
df[df$Department == "Sales", ]
df[df$Salary > 90000 & df$Department == "Engineering", ]

colnames(df)[colnames(df) == "FirstName"] <- "firstname"
str(df)
df[, !colnames(df) %in% 'firstname']
