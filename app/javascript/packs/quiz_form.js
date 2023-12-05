// app/javascript/packs/quiz_form.js
document.addEventListener('DOMContentLoaded', function() {
    const questionTypeSelects = document.querySelectorAll('.question-type-select');
    questionTypeSelects.forEach(function(select) {
      select.addEventListener('change', function() {
        const questionSelect = this.closest('.fields').querySelector('.question-select');
        const questionType = this.value;
        fetch(`/questions?question_type=${questionType}`)
          .then(response => response.json())
          .then(questions => {
            questionSelect.innerHTML = '';
            questions.forEach(function(question) {
              const option = document.createElement('option');
              option.value = question.id;
              option.text = question.desc;
              questionSelect.appendChild(option);
            });
          });
      });
    });
  });