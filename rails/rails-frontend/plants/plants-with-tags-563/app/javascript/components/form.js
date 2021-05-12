const toggleForm = () => {
  const button = document.querySelector('#toggle-form');
  if (button) {
    const form = document.querySelector('#new_plant');
    button.addEventListener('click', () => {
      form.classList.toggle('d-none');
    });
  }
}

export { toggleForm };
