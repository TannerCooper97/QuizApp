document.addEventListener('DOMContentLoaded', function() {
    const numberOfQuestionsInput = document.getElementById('number-of-questions');
    numberOfQuestionsInput.addEventListener('change', function() {
      const numberOfQuestions = this.value;
      const quizQuestionsDiv = document.getElementById('quiz-questions');
      quizQuestionsDiv.innerHTML = '';
      fetch('/questions.json')
        .then(response => response.json())
        .then(questions => {
          for (let i = 0; i < numberOfQuestions; i++) {
            const questionField = document.createElement('div');
            questionField.innerHTML = `
              <label for="quiz_quiz_questions_attributes_${i}_question_id">Question</label>
              <select name="quiz[quiz_questions_attributes][${i}][question_id]" id="quiz_quiz_questions_attributes_${i}_question_id">
                ${questions.map(question => `<option value="${question.id}">${question.desc}</option>`).join('')}
              </select>
            `;
            quizQuestionsDiv.appendChild(questionField);
          }
        });
    });
  });