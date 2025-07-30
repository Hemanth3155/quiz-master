const quizData = [
    {
        question: "What is the capital of France?",
        answers: {
            a: "Berlin",
            b: "Madrid",
            c: "Paris",
            d: "Rome"
        },
        correctAnswer: "c"
    },
    {
        question: "Which language runs in a web browser?",
        answers: {
            a: "Java",
            b: "C",
            c: "Python",
            d: "JavaScript"
        },
        correctAnswer: "d"
    },
    {
        question: "What does CSS stand for?",
        answers: {
            a: "Creative Style Sheets",
            b: "Cascading Style Sheets",
            c: "Computer Style Sheets",
            d: "Colorful Style Sheets"
        },
        correctAnswer: "b"
    }
];

function buildQuiz() {
    const quizContainer = document.getElementById("quiz");
    const output = [];

    quizData.forEach((q, i) => {
        const answers = [];
        for (let key in q.answers) {
            answers.push(
                `<label>
                    <input type="radio" name="question${i}" value="${key}" required>
                    ${key}: ${q.answers[key]}
                </label>`
            );
        }

        output.push(
            `<div class="question">${q.question}</div>
             <div class="answers">${answers.join("<br>")}</div>`
        );
    });

    quizContainer.innerHTML = output.join("");
}

function showResults() {
    const answerContainers = document.querySelectorAll(".answers");
    let score = 0;

    quizData.forEach((q, i) => {
        const selected = document.querySelector(`input[name=question${i}]:checked`);
        if (selected && selected.value === q.correctAnswer) {
            score++;
            answerContainers[i].style.color = "green";
        } else {
            answerContainers[i].style.color = "red";
        }
    });

    const resultsContainer = document.getElementById("results");
    resultsContainer.innerHTML = `You scored ${score} out of ${quizData.length}.`;
}

document.getElementById("submit").addEventListener("click", showResults);

buildQuiz();
