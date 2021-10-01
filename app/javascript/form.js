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
  change: {
    ["@blur"](event) {
      this[event.target.id].blurred = true;
      this.updateErrorMessages();
    },
  },
});
