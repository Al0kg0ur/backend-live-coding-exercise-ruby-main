require "pstore" # https://github.com/ruby/pstore
require "pry"

STORE_NAME = "tendable.pstore"
store = PStore.new(STORE_NAME)

QUESTIONS = {
  "q1" => "Can you code in Ruby?",
  "q2" => "Can you code in JavaScript?",
  "q3" => "Can you code in Swift?",
  "q4" => "Can you code in Java?",
  "q5" => "Can you code in C#?"
}.freeze

# TODO: FULLY IMPLEMENT
def do_prompt(store)
  answers = {}
  # Ask each question and get an answer from the user's input.
  QUESTIONS.each_key do |question_key|
    print QUESTIONS[question_key]
    ans = gets.chomp.downcase
    # Validate answer
    until ['yes', 'no', 'y', 'n'].include?(ans)
      print "Please answer with Yes or No: "
      ans = gets.chomp.downcase
    end
    answers[question_key] = ans
  end
  # Store the answers in the PStore
  store.transaction do
    store[:answers] ||= []
    store[:answers] << answers
  end
end

# Method to calculate and print rating for the latest run
def do_report(store)
  store.transaction(true) do
    answers = store[:answers]
    if answers.nil? || answers.empty?
      puts "No answers recorded yet."
      return
    end

    latest_answers = answers.last
    yes_count = latest_answers.values.count { |answer| ['yes', 'y'].include?(answer) }

    rating = (yes_count.to_f / QUESTIONS.size) * 100
    puts "Rating for this run: #{rating}% (#{yes_count} out of #{QUESTIONS.size} Yes)"
  end
end

# Method to calculate and print average rating for all runs
def average_rating(store)
  store.transaction(true) do
    answers = store[:answers]
    if answers.nil? || answers.empty?
      puts "No answers recorded yet."
      return
    end

    total_yes = answers.sum { |answer_set| answer_set.values.count { |answer| ['yes', 'y'].include?(answer) } }
    total_questions = QUESTIONS.size * answers.size
    average = (total_yes.to_f / total_questions) * 100

    puts "Average rating across all runs: #{average}%"
  end
end

# Main loop
loop do
  puts "Welcome to the Survey"
  do_prompt(store)
  do_report(store)
  average_rating(store)
  print "Would you like to take the survey again? (Yes/No): "
  repeat = gets.chomp.downcase
  break unless ['yes', 'y'].include?(repeat)
end
