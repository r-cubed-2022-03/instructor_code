# Load up the packages
source(here::here("R/package_loading.R"))

# Briefly glimpse the content of dataset
glimpse(NHANES)

# Select one column by its name without quotes
select(NHANES, Age)

select(NHANES, Age, Weight, BMI)

# To excude a column use minus
select(NHANES, -HeadCirc)

# All column starting with letters "BP" (blood pressure)
select(NHANES, starts_with("BP"))

# All columns ending in letters "Day"
select(NHANES, ends_with("Day"))

# all containing letters "Age"
select(NHANES, contains("Age"))

# Save the selected columns as a new dataframe
nhanes_small <- select(NHANES, Age, Gender,
                       BMI, Diabetes, PhysActive,
                       BPSysAve, BPDiaAve, Education)
# View the new dataframe
nhanes_small

# Rename all columns to snake case
nhanes_small <- rename_with(nhanes_small,
                            snakecase::to_snake_case)

# Look at the data frame
nhanes_small

nhanes_small <- rename(nhanes_small, sex=gender)

nhanes_small

# These two ways are the same
colnames(nhanes_small)

nhanes_small %>%
    colnames()

nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active=phys_active)
nhanes_small

# Filter

nhanes_small %>%
    filter(phys_active=="No")

# Participants who are physical active

nhanes_small %>%
    filter(phys_active == "Yes")

# Participants who have a BMI equal to 25
nhanes_small %>%
    filter(bmi==25)

# Participants who have a BMI equal to or
# more than 25
nhanes_small %>%
    filter(bmi>=25)


TRUE & TRUE

TRUE & FALSE

FALSE & FALSE

TRUE | TRUE

TRUE | FALSE

FALSE | FALSE

# When BMI is 25 and phys_active is No
nhanes_small %>%
    filter(bmi==25 & phys_active=="No")

# When BMI is 25 OR the phys_active is No
nhanes_small %>%
    filter(bmi==25 | phys_active=="No")


# Arranging data by age in ascending order

nhanes_small %>%
    arrange(age)

nhanes_small %>%
    arrange(education)

nhanes_small %>%
    arrange(desc(age))

# Arranging data by education then age
# in ascending order
nhanes_small %>%
    arrange(education, age)



nhanes_small %>%
    mutate(age=age*12)

nhanes_small %>%
    mutate(logged_bmi = log(bmi))


nhanes_small %>%
    mutate(age = age * 12,
           logged_bmi = log(bmi))

nhanes_small %>%
    mutate(old = if_else(age>=30, "Yes", "No"))

nhanes_small %>%
    summarise(max_bmi=max(bmi, na.rm = TRUE),
              min_bmi=min(bmi, na.rm = TRUE))

