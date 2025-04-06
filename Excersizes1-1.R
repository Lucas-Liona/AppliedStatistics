#These are Exercises 1.1 from textbook Probability with R - An introduction with Computer Science

"
### PROBLEM ###
1. In a class of 50 students of computing, 23 are female and 27 are male. The
results of their first year Java programming examination are as follows:
Females: 57, 59, 78, 79, 60, 65, 68, 71, 75, 48, 51, 55, 56, 41, 43, 44, 75, 78,
80,81,83,83,85
Males: 48, 49, 49, 30, 30, 31, 32, 35, 37, 41, 86, 42, 51, 53, 56, 42, 44, 50,
51,65,67,51,56,58,64,64,75
(a) Read these data into R by storing them in the following ways:
• As two vectors, one for the females and one for the males.
• As one vector, with a factor vector designating the gender.


        Hint.
        marks <- c(57, 59, 78, 79, 60,
        75, 48, 51, 55, 56, 41, 43, 44,
        81, 83, 83, 85, 48, 49, 49, 30,
        35, 37, 41, 86, 42, 51, 53, 56,
        51, 65, 67, 51, 56, 58, 64, 64, 75)
        
        reads the data into a vector designated marks.
        
        gendermarks <-rep(c('Female, 'Male'), c(23, 27))
        creates a vector containing female repeated 23 times, followed by male
        repeated 27 times.


(b) If it was discovered that the 34th was entered incorrectly and should have
obtained the marks 46 instead of 86, use an appropriate editing procedure
to change this.

(c) Save the workspace in a suitable directory for access later.
"

# Part (a): Read the data into R
# Option 1: As two separate vectors
females <- c(57, 59, 78, 79, 60, 65, 68, 71, 75, 48, 51, 55, 56, 41, 43, 44, 75, 78, 80, 81, 83, 83, 85)
males <- c(48, 49, 49, 30, 30, 31, 32, 35, 37, 41, 86, 42, 51, 53, 56, 42, 44, 50, 51, 65, 67, 51, 56, 58, 64, 64, 75)

# Option 2: As one vector with a factor vector for gender
marks <- c(57, 59, 78, 79, 60, 65, 68, 71, 75, 48, 51, 55, 56, 41, 43, 44, 75, 78, 
           80, 81, 83, 83, 85, 48, 49, 49, 30, 30, 31, 32, 35, 37, 41, 86, 42, 51, 
           53, 56, 42, 44, 50, 51, 65, 67, 51, 56, 58, 64, 64, 75)

gender <- rep(c("Female", "Male"), c(23, 27))

# Create a data frame for easier manipulation
student_data <- data.frame(marks = marks, gender = gender)

# Part (b): Edit incorrect mark
# Using the single vector approach
marks[34] <- 46

# Using the data frame approach
student_data$marks[34] <- 46

# Update male vector for completeness
males[11] <- 46  # This is the 11th element in males vector (86 → 46)

# Verify the changes
cat("Updated male marks:\n")
print(males)
cat("\nUpdated combined marks:\n")
print(marks[34])
cat("\nUpdated data frame:\n")
print(student_data[34,])

# Part (c): Save workspace
# This saves all objects in the current R session
save.image("class_marks.RData")

# Alternatively, save specific objects
save(females, males, marks, gender, student_data, file = "class_marks.RData")

# Basic analysis of the data (optional extension)
# Summary statistics by gender
cat("\nFemale summary statistics:\n")
summary(females)

cat("\nMale summary statistics:\n")
summary(males)

# Visual comparison
par(mar = c(4, 4, 2, 1))  # Bottom, left, top, right margins
boxplot(marks ~ gender, data = student_data, 
        main = "Java Programming Exam Scores by Gender",
        xlab = "Gender", ylab = "Score")