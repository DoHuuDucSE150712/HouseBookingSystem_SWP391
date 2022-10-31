let formBtn = document.querySelector('#open-bill');
let loginForm = document.querySelector('.login-form-container');
let formClose = document.querySelector('#form-close');

formBtn.addEventListener('click', () => {
    loginForm.classList.add('active');
});

formClose.addEventListener('click', () => {
    loginForm.classList.remove('active');
});
