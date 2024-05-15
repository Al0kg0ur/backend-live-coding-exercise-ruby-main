# Tendable Coding Assessment

## Usage

```sh
bundle
ruby questionnaire.rb
```

## Goal

The goal is to implement a survey where a user should be able to answer a series of Yes/No questions. After each run, a rating is calculated to let them know how they did. Another rating is also calculated to provide an overall score for all runs.

## Requirements

Possible question answers are: "Yes", "No", "Y", or "N" case insensitively to answer each question prompt.

The answers will need to be **persisted** so they can be used in calculations for subsequent runs >> it is proposed you use the pstore for this, already included in the Gemfile

After _each_ run the program should calculate and print a rating. The calculation for the rating is: `100 * number of yes answers / number of questions`.

The program should also print an average rating for all runs.

The questions can be found in questionnaire.rb

Ensure we can run your exercise

## Bonus Points

Updated readme with an explanation of your approach

Unit Tests

Code Comments

Dockerfile / Bash script if needed for us to run the exercise


## Implementation Approach
1. User Interaction: The user is prompted with questions and asked to provide Yes/No answers.
2. Storage: Answers provided by users are stored using the PStore gem, allowing persistence between program executions.
3. Rating Calculation: The rating for each run is calculated based on the number of "Yes" answers provided by the user.
4. Average Rating: The average rating across all runs is calculated to provide an overall performance score.
5. Validation: User input is validated to ensure they only provide "Yes" or "No" answers, ensuring data consistency.

6. Running the Application: To run the application, execute ruby questionnaire.rb in your terminal.

Dependencies
PStore: Used for storing user answers.

## Explanation:

1. do_prompt: This method prompts the user with questions from the QUESTIONS hash, collects their answers, and stores them in the PStore.

2. do_report: This method calculates and prints the rating for the latest run based on the number of "Yes" answers provided by the user.

3. average_rating: This method calculates and prints the average rating across all runs by iterating over all stored answers.

4. Main loop: The main loop allows the user to take the survey multiple times. After each run, the user is asked if they want to take the survey again.
# backend-live-coding-exercise-ruby-main
