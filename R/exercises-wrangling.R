# Load the packages
source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES


# 6.9

# 1. Select specific columns
nhanes_small %>%
    select(bp_sys_ave, education)

# 2. Rename columns
nhanes_small %>%
    rename(bp_sys = bp_sys_ave,
           bp_dia = bp_dia_ave)

# 3. Re-write with pipe
nhanes_small %>%
    select(bmi, contains("age"))

# 4. Re-write with pipe
nhanes_small %>%
    select(starts_with("bp_")) %>%
    rename(bp_systolic = bp_sys_ave)

# 6.13

# 1. BMI between 20 and 40, with diabetes
nhanes_small %>%
    filter(bmi >= 20 & bmi <= 40 & diabetes == "Yes")

# Pipe the data into mutate function and:
nhanes_modified <- nhanes_small %>% # dataset
    mutate(
        mean_arterial_pressure = ((2 * bp_dia_ave) + bp_sys_ave) / 3,
        young_child = if_else(age < 6, "Yes", "No")
    )

nhanes_modified
