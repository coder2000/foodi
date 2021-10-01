export default () => ({
  elements: [],
  init() {
    this.elements = [...this.$el.querySelectorAll("input[data-rules]")];
    this.elements.map((element) => {
      this[element.id] = {
        serverErrors: JSON.parse(element.dataset.serverErrors),
        blurred: false,
      };
    });
    this.updateErrorMessages();
  },
  getErrorMessage: function (element) {
    if (this[element.id].serverErrors.length > 0) {
      return this[element.id].serverErrors[0];
    }

    const error = Iodine.is(element.value, JSON.parse(element.dataset.rules));
    if (error !== true && this[element.id].blurred) {
      return Iodine.getErrorMessage(error);
    }

    return "";
  },
  updateErrorMessages: function () {
    this.elements.map((element) => {
      this[element.id].errorMessage = this.getErrorMessage(element);
    });
  },
  submit: function (event) {
    const invalidElements = this.elements.filter((element) => {
      return (
        Iodine.is(element.value, JSON.parse(element.dataset.rules)) !== true
      );
    });

    if (invalidElements.length > 0) {
      event.preventDefault();

      document.getElementById(invalidElements[0].id).scrollIntoView();

      this.elements.map((element) => {
        this[element.id].blurred = true;
      });

      this.updateErrorMessages();
      return false;
    }
  },
  change: {
    ["@blur"](event) {
      this[event.target.id].blurred = true;
      this.updateErrorMessages();
    },
    ["@input"](event) {
      this[event.target.id].serverErrors = [];
      this.updateErrorMessages();
    },
  },
});
