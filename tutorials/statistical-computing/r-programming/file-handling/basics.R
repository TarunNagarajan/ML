student_grades <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Math = c(90, 85, 92),
  Science = c(88, 91, 85)
)

write.csv(student_grades, "tester.csv", row.names = FALSE)

my_grades <- read.csv("tester.csv")
head(my_grades)

my_grades$Science <- NULL
my_grades
student_grades

write.table(student_grades, "tabular.txt", sep = "\t", row.names = FALSE)
grade_table <- read.table("tabular.txt", header = TRUE, sep = "\t")
grade_table
grade_table$Math <- NULL
grade_table

sample_text <- c("This is the first line.", "This is the second line!", "This is the third line?")
writeLines(sample_text, "sample.txt")

sample_vector <- readLines("sample.txt")
sample_vector
print(sample_vector[2])

sales_df <- data.frame(
  ProductID = c("A101", "B202", "A101", "C303", "B202"),
  Region = c("North America", "Europe", "North America", "Asia", "Europe"),
  UnitsSold = c(150, 210, 180, 250, 230),
  SalePrice = c(10.50, 12.00, 10.75, 9.25, 12.50)
)
write.csv(sales_df, "sales_data.csv", row.names = FALSE)

csv_df <- read.csv("sales_data.csv")
csv_df

csv_df$TotalRevenue <- csv_df$UnitsSold * csv_df$SalePrice
csv_df

europe_sales <- data.frame(csv_df[csv_df$Region == "Europe", ])
europe_sales

write.csv("europe_report.csv", row.names = FALSE)

# Run this code first to create the report.txt file
report_text <- c(
  "The analysis of the data is complete.",
  "We found that the data shows a significant trend.",
  "Further data collection is recommended."
)
writeLines(report_text, "report.txt")

report_lines <- readLines("report.txt")
report_lines[2]
full_report <- paste(report_lines, collapse = " ")
full_report

sensor_data <- "1;22.5;active\n2;23.1;active\n3;22.9;inactive"
writeLines(sensor_data, "sensor_log.txt")

sensor_log <- read.table("sensor_log.txt", header = FALSE, sep = ";")
sensor_log

colnames(sensor_log)[colnames(sensor_log) == "V1"] <- "SensorID"
colnames(sensor_log)[colnames(sensor_log) == "V2"] <- "Temperature"
colnames(sensor_log)[colnames(sensor_log) == "V3"] <- "Status"
sensor_log

sensor_log$Status
str(sensor_log)

sensor_log$Status <- factor(sensor_log$Status)
str(sensor_log)
sensor_log

str(sensor_log)

log_entry <- "2025-09-19 10:00 - System Initialized"
writeLines(log_entry, "activity.log")

new_log_entry <- "2025-09-19 10:05 - Data Processing Started"
write(new_log_entry, file = "activity.log", append = TRUE, sep = "\n")

log_vector <- readLines("activity.log")
log_vector
