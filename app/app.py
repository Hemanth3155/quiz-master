from flask import Flask, render_template, request
app = Flask(__name__)

questions = [
    {"question": "What is the capital of France?", "options": ["Paris", "London", "Berlin"], "answer": "Paris"},
    {"question": "What is 2 + 2?", "options": ["3", "4", "5"], "answer": "4"},
    {"question": "Which planet is known as the Red Planet?", "options": ["Earth", "Mars", "Jupiter"], "answer": "Mars"}
]

@app.route('/', methods=['GET', 'POST'])
def quiz():
    if request.method == 'POST':
        score = 0
        for i, q in enumerate(questions):
            user_answer = request.form.get(f'q{i}')
            if user_answer == q['answer']:
                score += 1
        return f"<h2>Your score: {score}/{len(questions)}</h2><br><a href='/'>Try again</a>"
    return render_template('quiz.html', questions=questions)

if __name__ == '__main__':
    app.run(debug=True)
